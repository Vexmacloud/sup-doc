"use strict";
/**
 * Copyright (c) 2018-present, Ephox, Inc.
 *
 * This source code is licensed under the Apache 2 license found in the
 * LICENSE file in the root directory of this source tree.
 *
 */
var __assign = (this && this.__assign) || function () {
    __assign = Object.assign || function(t) {
        for (var s, i = 1, n = arguments.length; i < n; i++) {
            s = arguments[i];
            for (var p in s) if (Object.prototype.hasOwnProperty.call(s, p))
                t[p] = s[p];
        }
        return t;
    };
    return __assign.apply(this, arguments);
};
Object.defineProperty(exports, "__esModule", { value: true });
exports.Editor = void 0;
var ScriptLoader_1 = require("../ScriptLoader");
var TinyMCE_1 = require("../TinyMCE");
var Utils_1 = require("../Utils");
var EditorPropTypes_1 = require("./EditorPropTypes");
var vue_1 = require("vue");
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
exports.Editor = vue_1.defineComponent({
    props: EditorPropTypes_1.editorProps,
    setup: function (props, ctx) {
        var _a = vue_1.toRefs(props), disabled = _a.disabled, modelValue = _a.modelValue;
        var element = vue_1.ref(null);
        var vueEditor = null;
        var elementId = props.id || Utils_1.uuid('tiny-vue');
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
            var finalInit = __assign(__assign({}, props.init), { readonly: props.disabled, selector: "#" + elementId, plugins: Utils_1.mergePlugins(props.init && props.init.plugins, props.plugins), toolbar: props.toolbar || (props.init && props.init.toolbar), inline: inlineEditor, setup: function (editor) {
                    vueEditor = editor;
                    editor.on('init', function (e) { return Utils_1.initEditor(e, props, ctx, editor, modelValue, content); });
                    if (props.init && typeof props.init.setup === 'function') {
                        props.init.setup(editor);
                    }
                } });
            if (Utils_1.isTextarea(element.value)) {
                element.value.style.visibility = '';
            }
            TinyMCE_1.getTinymce().init(finalInit);
            mounting = false;
        };
        vue_1.watch(disabled, function (disable) {
            if (vueEditor !== null) {
                vueEditor.setMode(disable ? 'readonly' : 'design');
            }
        });
        vue_1.onMounted(function () {
            if (TinyMCE_1.getTinymce() !== null) {
                initWrapper();
            }
            else if (element.value && element.value.ownerDocument) {
                var channel = props.cloudChannel ? props.cloudChannel : '5';
                var apiKey = props.apiKey ? props.apiKey : 'no-api-key';
                var scriptSrc = Utils_1.isNullOrUndefined(props.tinymceScriptSrc) ?
                    "https://cdn.tiny.cloud/1/" + apiKey + "/tinymce/" + channel + "/tinymce.min.js" :
                    props.tinymceScriptSrc;
                ScriptLoader_1.ScriptLoader.load(element.value.ownerDocument, scriptSrc, initWrapper);
            }
        });
        vue_1.onBeforeUnmount(function () {
            if (TinyMCE_1.getTinymce() !== null) {
                TinyMCE_1.getTinymce().remove(vueEditor);
            }
        });
        if (!inlineEditor) {
            vue_1.onActivated(function () {
                if (!mounting) {
                    initWrapper();
                }
            });
            vue_1.onDeactivated(function () {
                var _a;
                if (!modelBind) {
                    cache = vueEditor.getContent();
                }
                (_a = TinyMCE_1.getTinymce()) === null || _a === void 0 ? void 0 : _a.remove(vueEditor);
            });
        }
        return function () { return inlineEditor ?
            renderInline(vue_1.h, elementId, element, props.tagName) :
            renderIframe(vue_1.h, elementId, element); };
    }
});
