<?php
/**
 * @copyright Bluz PHP Team
 * @link https://github.com/bluzphp/skeleton
 */

/**
 * @namespace
 */
namespace Application\ContactUs;

/**
 * Contact us Table
 *
 * @package  Application\ContactUs
 *
 * @method   static Row findRow($primaryKey)
 * @method   static Row findRowWhere($whereList)
 */
class Table extends \Bluz\Db\Table
{
    /**
     * Table
     *
     * @var string
     */
    protected $table = 'contact_us';

    /**
     * Primary key(s)
     * @var array
     */
    protected $primary = array('id');

    /**
     * update mark_read field
     *
     * @param int $id
     * @param int $value
     *
     * @return int
     */
    public static function updateRead($id, $value)
    {
        return self::update(['mark_read' => $value], ['id' => $id]);
    }

    /**
     * update mark_answered field
     *
     * @param int $id
     * @param int $value
     *
     * @return int
     */
    public static function updateAnswered($id, $value)
    {
        return self::update(['mark_answered' => $value], ['id' => $id]);
    }
}
