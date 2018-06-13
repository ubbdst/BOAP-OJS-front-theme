<?php
import('lib.pkp.classes.plugins.ThemePlugin');
class BoapFrontPageThemePlugin extends ThemePlugin {

    /**
     * Load the custom styles for our theme
     * @return null
     */
    public function init() {
        $this->addStyle('stylesheet', 'dist/css/style.css');
    }

    /**
     * Get the display name of this theme
     * @return string
     */
    function getDisplayName() {
        return 'BOAP Front Page Theme';
    }

    /**
     * Get the description of this plugin
     * @return string
     */
    function getDescription() {
        return 'BOAP Front Page Theme Plugin.';
    }
}