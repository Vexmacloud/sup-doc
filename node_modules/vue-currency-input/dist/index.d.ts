import { Ref } from 'vue';

/**
 * @internal
 */
interface CurrencyInputValue {
    number: number | null;
    formatted: string | null;
}
interface NumberRange {
    min?: number;
    max?: number;
}
declare enum CurrencyDisplay {
    symbol = "symbol",
    narrowSymbol = "narrowSymbol",
    code = "code",
    name = "name",
    hidden = "hidden"
}
declare enum ValueScaling {
    precision = "precision",
    thousands = "thousands",
    millions = "millions",
    billions = "billions"
}
interface CurrencyInputOptions {
    accountingSign?: boolean;
    autoDecimalDigits?: boolean;
    currency: string;
    currencyDisplay?: CurrencyDisplay;
    hideCurrencySymbolOnFocus?: boolean;
    hideGroupingSeparatorOnFocus?: boolean;
    hideNegligibleDecimalDigitsOnFocus?: boolean;
    locale?: string;
    precision?: NumberRange | number;
    useGrouping?: boolean;
    valueRange?: NumberRange;
    valueScaling?: ValueScaling;
}
interface UseCurrencyInput {
    formattedValue: Ref<string | null>;
    inputRef: Ref;
    numberValue: Ref<number | null>;
    setOptions: (options: CurrencyInputOptions) => void;
    setValue: (number: number | null) => void;
}

declare function useCurrencyInput(options: CurrencyInputOptions, autoEmit?: boolean): UseCurrencyInput;

export { CurrencyDisplay, CurrencyInputOptions, CurrencyInputValue, NumberRange, UseCurrencyInput, ValueScaling, useCurrencyInput };
