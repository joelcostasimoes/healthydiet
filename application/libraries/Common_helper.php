<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed'); 

class Common_helper {

    /**
     * 
     * @param type $dateInteger
     * @param type $format
     * @return string
     */
    public function getFormatedDate($dateInteger, $format) {
        if (strlen(trim($dateInteger)) > 0) {
            return strftime($format, $dateInteger);
        }

        return "";
    }

    /**
     * Thanks to http://stackoverflow.com/users/87015/salman-a
     * @param type $haystack
     * @param type $needle
     * @return type
     */
    public function startsWith($haystack, $needle) {
        // search backwards starting from haystack length characters from the end
        return $needle === "" || strrpos($haystack, $needle, -strlen($haystack)) !== FALSE;
    }

    /**
     * Thanks to http://stackoverflow.com/users/87015/salman-a
     * @param type $haystack
     * @param type $needle
     * @return type
     */
    public function endsWith($haystack, $needle) {
        // search forward starting from end minus needle length characters
        return $needle === "" || (($temp = strlen($haystack) - strlen($needle)) >= 0 && strpos($haystack, $needle, $temp) !== FALSE);
    }

    /**
     * @thanks to Nick Andren http://stackoverflow.com/users/775643/nick-andren
     * nl2p
     * This public function will convert newlines to HTML paragraphs
     * without paying attention to HTML tags. Feed it a raw string and it will
     * simply return that string sectioned into HTML paragraphs
     * @param type $str
     * @return string
     */
    public function nl2p($str) {
        $arr = explode("\n", $str);
        $out = '';

        for ($i = 0; $i < count($arr); $i++) {
            if (strlen(trim($arr[$i])) > 0) {
                $out.='<p>' . trim($arr[$i]) . '</p>';
            }
        }
        return $out;
    }

    /**
     * Based on nl2p
     * nl2li
     * This public function will convert newlines to li elements
     * without paying attention to HTML tags. Feed it a raw string and it will
     * simply return that string sectioned into HTML paragraphs
     * @param type $str
     * @return string
     * @author Emanuel Coelho <emanuelcoelho1986@gmail.com>
     */
    public function nl2li($str) {
        $arr = explode("\n", $str);
        $out = '';

        for ($i = 0; $i < count($arr); $i++) {
            if (strlen(trim($arr[$i])) > 0) {
                $out.='<li>' . trim($arr[$i]) . '</li>';
            }
        }
        return $out;
    }

    /* Custom for HCVP site */

    /**
     * Same as nl2li but this recieves an image to concat with each line
     * @param type $str
     * @return string
     */
    public function nl2liWithIcon($str, $element = '<img src="images/icones/ico_check.svg">') {
        $arr = explode("\n", $str);
        $out = '';

        for ($i = 0; $i < count($arr); $i++) {
            if (strlen(trim($arr[$i])) > 0) {
                $out.='<li>' . $element . trim($arr[$i]) . '</li>';
            }
        }
        return $out;
    }

    /**
     * @thanks to Nick Andren http://stackoverflow.com/users/775643/nick-andren
     * nl2p_html This public function will add paragraph tags 
     * around textual content of an HTML file, leaving
     * the HTML itself intact This public function assumes that the HTML syntax is correct and that the '<' and '>' characters
     * are not used in any of the values for any tag attributes. If these assumptions are not met,
     * mass paragraph chaos may ensue. Be safe.
     * @param type $str
     * @return string
     */
    public function nl2p_html($str) {

        // If we find the end of an HTML header, assume that this is part of a standard HTML file. Cut off everything including the
        // end of the head and save it in our output string, then trim the head off of the input. This is mostly because we don't
        // want to surrount anything like the HTML title tag or any style or script code in paragraph tags. 
        if (strpos($str, '</head>') !== false) {
            $out = substr($str, 0, strpos($str, '</head>') + 7);
            $str = substr($str, strpos($str, '</head>') + 7);
        }

        // First, we explode the input string based on wherever we find HTML tags, which start with '<'
        $arr = explode('<', $str);

        // Next, we loop through the array that is broken into HTML tags and look for textual content, or
        // anything after the >
        for ($i = 0; $i < count($arr); $i++) {
            if (strlen(trim($arr[$i])) > 0) {
                // Add the '<' back on since it became collateral damage in our explosion as well as the rest of the tag
                $html = '<' . substr($arr[$i], 0, strpos($arr[$i], '>') + 1);

                // Take the portion of the string after the end of the tag and explode that by newline. Since this is after
                // the end of the HTML tag, this must be textual content.
                $sub_arr = explode("\n", substr($arr[$i], strpos($arr[$i], '>') + 1));

                // Initialize the output string for this next loop
                $paragraph_text = '';

                // Loop through this new array and add paragraph tags (<p>...</p>) around any element that isn't empty
                for ($j = 0; $j < count($sub_arr); $j++) {
                    if (strlen(trim($sub_arr[$j])) > 0)
                        $paragraph_text.='<p>' . trim($sub_arr[$j]) . '</p>';
                }

                // Put the text back onto the end of the HTML tag and put it in our output string
                $out.=$html . $paragraph_text;
            }
        }

        // Throw it back into our program
        return $out;
    }

    /**
     * @account ei14560 Emanuel Coelho Twitter's Account
     * @param String $haystack
     * @param String $needle
     * @return boolean
     */
    public function strContains($haystack, $needle) {
        if (strpos(strtoupper($haystack), strtoupper($needle)) !== false) {
            return TRUE;
        }

        return FALSE;
    }

    /**
     * @account Mauro Reis Vieira | @mauroreisvieira
     * @param Array $array
     * @return array
     */
    public function var_debug($array) {
        echo '<pre>';
        if (is_array($array)) {
            print_r($array);
        } else {
            print_r($array);
        }
        echo '</pre>';
    }

}
