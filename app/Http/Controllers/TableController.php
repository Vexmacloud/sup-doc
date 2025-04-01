<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Schema;
use Illuminate\Support\Facades\DB;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Cache;


class TableController extends Controller
{
    public function createTable(Request $request)
{
    $tableName = $request->input('table_name');
    $columns = $request->input('columns');

    if (!Schema::hasTable($tableName)) {
        Schema::create($tableName, function (Blueprint $table) use ($columns) {
            $table->id();

            foreach ($columns as $column) {
                $columnType = $column['type'];
                $columnName = $column['name'];
                $columnKey = $column['foreign_key'];
                // Handle different column types
                switch ($columnType) {
                    case 'string':
                        $columnDefinition = $table->string($columnName);
                        break;
                    case 'integer':
                        $columnDefinition = $table->integer($columnName);
                        break;
                        case 'tinyInt':
                            $columnDefinition = $table->tinyInteger($columnName);
                            break;
                        case 'unsignedbigInteger':
                            $columnDefinition = $table->unsignedBigInteger($columnName);
                            break;
                    case 'bigInteger':
                        $columnDefinition = $table->bigInteger($columnName);
                        break;
                    case 'text':
                        $columnDefinition = $table->text($columnName);
                        break;
                    case 'boolean':
                        $columnDefinition = $table->boolean($columnName);
                        break;
                    case 'decimal':
                        $columnDefinition = $table->decimal($columnName, $column['precision'] ?? 8, $column['scale'] ?? 2);
                        break;
                    case 'timestamp':
                        $columnDefinition = $table->timestamp($columnName);
                        break;
                    case 'dateTime':
                        $columnDefinition = $table->dateTime($columnName);
                        break;
                    case 'date':
                        $columnDefinition = $table->date($columnName);
                        break;
                    case 'json':
                        $columnDefinition = $table->json($columnName);
                        break;
                    case 'enum':
                        $columnDefinition = $table->enum($columnName, $column['values']);
                        break;
                    // Add more column types as needed...
                    default:
                        // Handle unknown column types (e.g., log an error or use a default type)
                        $columnDefinition = $table->string($columnName);
                        break;

                      
                }
                if ($columnKey) {
                    $table->index($columnName);
                }

                if ($column['nullable']) {
                    $columnDefinition->nullable();
                }
                // if ($column['foreign_key']) {
                //     $table->foreign($columnName)
                //           ->references($column['foreign_column'])
                //           ->on($column['foreign_table']);
                // }
            }

            $table->timestamps();
        });

        return response()->json([
            'message' => 'Table created successfully!',
            'table_name' => $tableName
        ]);
    }

    return response()->json([
        'message' => 'Table already exists.'
    ], 400);
}


    public function getTableData(Request $request, $tableName)
    {
        $tableData = DB::table($tableName)->get()->toArray();

        return response()->json([
            'columns' => Schema::getColumnListing($tableName),
            'data' => $tableData
        ]);
    }
    public function getTableList()
{
    $cacheKey = 'table_list';

    // if (Cache::has($cacheKey)) {
    //     return Cache::get($cacheKey);
    // }

    $tables = [];

    try {
        $tablenames = DB::connection(env('DB_CONNECTION'))
            ->select('SELECT table_name FROM information_schema.tables WHERE table_schema = ?', [env('DB_DATABASE')]);

        foreach ($tablenames as $tableName) {
            $columns = DB::connection(env('DB_CONNECTION'))
                ->getSchemaBuilder()
                ->getColumnListing($tableName->table_name);

            $tables[] = [
                'name' => $tableName->table_name,
                'columns' => $columns
            ];
        }

        // Cache::put($cacheKey, response()->json(['tables' => $tables]), now()->addHour());

        return response()->json(['tables' => $tables]);
    } catch (\Exception $e) {
        // Handle the exception, e.g., log the error or return an appropriate error response
        return response()->json(['error' => 'An error occurred while fetching the table list.'], 500);
    }
}
}
