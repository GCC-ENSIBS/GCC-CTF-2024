/*!
FullCalendar v5.10.1
Docs & License: https://fullcalendar.io/
(c) 2021 Adam Shaw
*/
'use strict';

Object.defineProperty(exports, '__esModule', { value: true });

var tslib = require('tslib');
var common = require('@fullcalendar/common');
;

var BootstrapTheme = /** @class */ (function (_super) {
    tslib.__extends(BootstrapTheme, _super);
    function BootstrapTheme() {
        return _super !== null && _super.apply(this, arguments) || this;
    }
    return BootstrapTheme;
}(common.Theme));
BootstrapTheme.prototype.classes = {
    root: 'fc-theme-bootstrap',
    table: 'table-bordered',
    tableCellShaded: 'table-active',
    buttonGroup: 'btn-group',
    button: 'btn btn-primary',
    buttonActive: 'active',
    popover: 'popover',
    popoverHeader: 'popover-header',
    popoverContent: 'popover-body',
};
BootstrapTheme.prototype.baseIconClass = 'fa';
BootstrapTheme.prototype.iconClasses = {
    close: 'fa-times',
    prev: 'fa-chevron-left',
    next: 'fa-chevron-right',
    prevYear: 'fa-angle-double-left',
    nextYear: 'fa-angle-double-right',
};
BootstrapTheme.prototype.rtlIconClasses = {
    prev: 'fa-chevron-right',
    next: 'fa-chevron-left',
    prevYear: 'fa-angle-double-right',
    nextYear: 'fa-angle-double-left',
};
BootstrapTheme.prototype.iconOverrideOption = 'bootstrapFontAwesome'; // TODO: make TS-friendly. move the option-processing into this plugin
BootstrapTheme.prototype.iconOverrideCustomButtonOption = 'bootstrapFontAwesome';
BootstrapTheme.prototype.iconOverridePrefix = 'fa-';
var plugin = common.createPlugin({
    themeClasses: {
        bootstrap: BootstrapTheme,
    },
});

exports.BootstrapTheme = BootstrapTheme;
exports.default = plugin;
