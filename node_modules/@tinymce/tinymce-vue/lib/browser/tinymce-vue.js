var Editor = (function (vue) {
    'use strict';

    /*! *****************************************************************************
    Copyright (c) Microsoft Corporation.

    Permission to use, copy, modify, and/or distribute this software for any
    purpose with or without fee is hereby granted.

    THE SOFTWARE IS PROVIDED "AS IS" AND THE AUTHOR DISCLAIMS ALL WARRANTIES WITH
    REGARD TO THIS SOFTWARE INCLUDING ALL IMPLIED WARRANTIES OF MERCHANTABILITY
    AND FITNESS. IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR ANY SPECIAL, DIRECT,
    INDIRECT, OR CONSEQUENTIAL DAMAGES OR ANY DAMAGES WHATSOEVER RESULTING FROM
    LOSS OF USE, DATA OR PROFITS, WHETHER IN AN ACTION OF CONTRACT, NEGLIGENCE OR
    OTHER TORTIOUS ACTION, ARISING OUT OF OR IN CONNECTION WITH THE USE OR
    PERFORMANCE OF THIS SOFTWARE.
    ***************************************************************************** */

    var __assign = function() {
        __assign = Object.assign || function __assign(t) {
            for (var s, i = 1, n = arguments.length; i < n; i++) {
                s = arguments[i];
                for (var p in s) if (Object.prototype.hasOwnProperty.call(s, p)) t[p] = s[p];
            }
            return t;
        };
        return __assign.apply(this, arguments);
    };

    /**
     * Copyright (c) 2018-present, Ephox, Inc.
     *
     * This source code is licensed under the Apache 2 license found in the
     * LICENSE file in the root directory of this source tree.
     *
     */
    var validEvents = [
        'onActivate',
        'onAddUndo',
        'onBeforeAddUndo',
        'onBeforeExecCommand',
        'onBeforeGetContent',
        'onBeforeRenderUI',
        'onBeforeSetContent',
        'onBeforePaste',
        'onBlur',
        'onChange',
        'onClearUndos',
        'onClick',
        'onContextMenu',
        'onCopy',
        'onCut',
        'onDblclick',
        'onDeactivate',
        'onDirty',
        'onDrag',
        'onDragDrop',
        'onDragEnd',
        'onDragGesture',
        'onDragOver',
        'onDrop',
        'onExecCommand',
        'onFocus',
        'onFocusIn',
        'onFocusOut',
        'onGetContent',
        'onHide',
        'onInit',
        'onKeyDown',
        'onKeyPress',
        'onKeyUp',
        'onLoadContent',
        'onMouseDown',
        'onMouseEnter',
        'onMouseLeave',
        'onMouseMove',
        'onMouseOut',
        'onMouseOver',
        'onMouseUp',
        'onNodeChange',
        'onObjectResizeStart',
        'onObjectResized',
        'onObjectSelected',
        'onPaste',
        'onPostProcess',
        'onPostRender',
        'onPreProcess',
        'onProgressState',
        'onRedo',
        'onRemove',
        'onReset',
        'onSaveContent',
        'onSelectionChange',
        'onSetAttrib',
        'onSetContent',
        'onShow',
        'onSubmit',
        'onUndo',
        'onVisualAid'
    ];
    var isValidKey = function (key) {
        return validEvents.map(function (event) { return event.toLowerCase(); }).indexOf(key.toLowerCase()) !== -1;
    };
    var bindHandlers = function (initEvent, listeners, editor) {
        Object.keys(listeners)
            .filter(isValidKey)
            .forEach(function (key) {
            var handler = listeners[key];
            if (typeof handler === 'function') {
                if (key === 'onInit') {
                    handler(initEvent, editor);
                }
                else {
                    editor.on(key.substring(2), function (e) { return handler(e, editor); });
                }
            }
        });
    };
    var bindModelHandlers = function (props, ctx, editor, modelValue) {
        var modelEvents = props.modelEvents ? props.modelEvents : null;
        var normalizedEvents = Array.isArray(modelEvents) ? modelEvents.join(' ') : modelEvents;
        vue.watch(modelValue, function (val, prevVal) {
            if (editor && typeof val === 'string' && val !== prevVal && val !== editor.getContent({ format: props.outputFormat })) {
                editor.setContent(val);
            }
        });
        editor.on(normalizedEvents ? normalizedEvents : 'change input undo redo', function () {
            ctx.emit('update:modelValue', editor.getContent({ format: props.outputFormat }));
        });
    };
    var initEditor = function (initEvent, props, ctx, editor, modelValue, content) {
        editor.setContent(content());
        if (ctx.attrs['onUpdate:modelValue']) {
            bindModelHandlers(props, ctx, editor, modelValue);
        }
        bindHandlers(initEvent, ctx.attrs, editor);
    };
    var unique = 0;
    var uuid = function (prefix) {
        var time = Date.now();
        var random = Math.floor(Math.random() * 1000000000);
        unique++;
        return prefix + '_' + random + unique + String(time);
    };
    var isTextarea = function (element) {
        return element !== null && element.tagName.toLowerCase() === 'textarea';
    };
    var normalizePluginArray = function (plugins) {
        if (typeof plugins === 'undefined' || plugins === '') {
            return [];
        }
        return Array.isArray(plugins) ? plugins : plugins.split(' ');
    };
    var mergePlugins = function (initPlugins, inputPlugins) {
        return normalizePluginArray(initPlugins).concat(normalizePluginArray(inputPlugins));
    };
    var isNullOrUndefined = function (value) {
        return value === null || value === undefined;
    };

    /**
     * Copyright (c) 2018-present, Ephox, Inc.
     *
     * This source code is licensed under the Apache 2 license found in the
     * LICENSE file in the root directory of this source tree.
     *
     */
    var createState = function () { return ({
        listeners: [],
        scriptId: uuid('tiny-script'),
        scriptLoaded: false
    }); };
    var CreateScriptLoader = function () {
        var state = createState();
        var injectScriptTag = function (scriptId, doc, url, callback) {
            var scriptTag = doc.createElement('script');
            scriptTag.referrerPolicy = 'origin';
            scriptTag.type = 'application/javascript';
            scriptTag.id = scriptId;
            scriptTag.src = url;
            var handler = function () {
                scriptTag.removeEventListener('load', handler);
                callback();
            };
            scriptTag.addEventListener('load', handler);
            if (doc.head) {
                doc.head.appendChild(scriptTag);
            }
        };
        var load = function (doc, url, callback) {
            if (state.scriptLoaded) {
                callback();
            }
            else {
                state.listeners.push(callback);
                if (!doc.getElementById(state.scriptId)) {
                    injectScriptTag(state.scriptId, doc, url, function () {
                        state.listeners.forEach(function (fn) { return fn(); });
                        state.scriptLoaded = true;
                    });
                }
            }
        };
        // Only to be used by tests.
        var reinitialize = function () {
            state = createState();
        };
        return {
            load: load,
            reinitialize: reinitialize
        };
    };
    var ScriptLoader = CreateScriptLoader();

    /**
     * Copyright (c) 2018-present, Ephox, Inc.
     *
     * This source code is licensed under the Apache 2 license found in the
     * LICENSE file in the root directory of this source tree.
     *
     */
    var getGlobal = function () { return (typeof window !== 'undefined' ? window : global); };
    var getTinymce = function () {
        var global = getGlobal();
        return global && global.tinymce ? global.tinymce : null;
    };

    /**
     * Copyright (c) 2018-present, Ephox, Inc.
     *
     * This source code is licensed under the Apache 2 license found in the
     * LICENSE file in the root directory of this source tree.
     *
     */
    var editorProps = {
        apiKey: String,
        cloudChannel: String,
        id: String,
        init: Object,
        initialValue: String,
        inline: Boolean,
        modelEvents: [String, Array],
        plugins: [String, Array],
        tagName: String,
        toolbar: [String, Array],
        modelValue: String,
        disabled: Boolean,
        tinymceScriptSrc: String,
        outputFormat: {
            type: String,
            validator: function (prop) { return prop === 'html' || prop === 'text'; }
        },
    };

    /**
     * Copyright (c) 2018-present, Ephox, Inc.
     *
     * This source code is licensed under the Apache 2 license found in the
     * LICENSE file in the root directory of this source tree.
     *
     */
    var renderInline = function (ce, id, elementRef, tagName) {
        return ce(tagName ? tagName : 'div', {
            id: id,
            ref: elementRef
        });
    };
    var renderIframe = function (ce, id, elementRef) {
        return ce('textarea', {
            id: id,
            visibility: 'hidden',
            ref: elementRef
        });
    };
    var Editor = vue.defineComponent({
        props: editorProps,
        setup: function (props, ctx) {
            var _a = vue.toRefs(props), disabled = _a.disabled, modelValue = _a.modelValue;
            var element = vue.ref(null);
            var vueEditor = null;
            var elementId = props.id || uuid('tiny-vue');
            var inlineEditor = (props.init && props.init.inline) || props.inline;
            var modelBind = !!ctx.attrs['onUpdate:modelValue'];
            var mounting = true;
            var initialValue = props.initialValue ? props.initialValue : '';
            var cache = '';
            var getContent = function (isMounting) { return modelBind ?
                function () { return ((modelValue === null || modelValue === void 0 ? void 0 : modelValue.value) ? modelValue.value : ''); } :
                function () { return isMounting ? initialValue : cache; }; };
            var initWrapper = function () {
                var content = getContent(mounting);
                var finalInit = __assign(__assign({}, props.init), { readonly: props.disabled, selector: "#" + elementId, plugins: mergePlugins(props.init && props.init.plugins, props.plugins), toolbar: props.toolbar || (props.init && props.init.toolbar), inline: inlineEditor, setup: function (editor) {
                        vueEditor = editor;
                        editor.on('init', function (e) { return initEditor(e, props, ctx, editor, modelValue, content); });
                        if (props.init && typeof props.init.setup === 'function') {
                            props.init.setup(editor);
                        }
                    } });
                if (isTextarea(element.value)) {
                    element.value.style.visibility = '';
                }
                getTinymce().init(finalInit);
                mounting = false;
            };
            vue.watch(disabled, function (disable) {
                if (vueEditor !== null) {
                    vueEditor.setMode(disable ? 'readonly' : 'design');
                }
            });
            vue.onMounted(function () {
                if (getTinymce() !== null) {
                    initWrapper();
                }
                else if (element.value && element.value.ownerDocument) {
                    var channel = props.cloudChannel ? props.cloudChannel : '5';
                    var apiKey = props.apiKey ? props.apiKey : 'no-api-key';
                    var scriptSrc = isNullOrUndefined(props.tinymceScriptSrc) ?
                        "https://cdn.tiny.cloud/1/" + apiKey + "/tinymce/" + channel + "/tinymce.min.js" :
                        props.tinymceScriptSrc;
                    ScriptLoader.load(element.value.ownerDocument, scriptSrc, initWrapper);
                }
            });
            vue.onBeforeUnmount(function () {
                if (getTinymce() !== null) {
                    getTinymce().remove(vueEditor);
                }
            });
            if (!inlineEditor) {
                vue.onActivated(function () {
                    if (!mounting) {
                        initWrapper();
                    }
                });
                vue.onDeactivated(function () {
                    var _a;
                    if (!modelBind) {
                        cache = vueEditor.getContent();
                    }
                    (_a = getTinymce()) === null || _a === void 0 ? void 0 : _a.remove(vueEditor);
                });
            }
            return function () { return inlineEditor ?
                renderInline(vue.h, elementId, element, props.tagName) :
                renderIframe(vue.h, elementId, element); };
        }
    });

    /**
     * Copyright (c) 2018-present, Ephox, Inc.
     *
     * This source code is licensed under the Apache 2 license found in the
     * LICENSE file in the root directory of this source tree.
     *
     */

    return Editor;

}(Vue));
