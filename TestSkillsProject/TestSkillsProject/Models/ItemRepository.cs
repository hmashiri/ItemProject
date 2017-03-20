using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace TestSkillsProject.Models
{
    public class ItemRepository
    {
        private static readonly String ITEM_FILE_NAME = "c:\\Users\\hadji\\Desktop\\items.txt";
        private static readonly int ID_FIELD = 0;
        private static readonly int NAME_FIELD = 1;
        private static readonly int PRICE_FIELD = 2;


        public static List<Item> importItems()
        {
            List<Item> itemList = new List<Item>();

            try
            {
                var lines = System.IO.File.ReadAllLines(@ITEM_FILE_NAME).ToList().Skip(1).ToList();           
                return lines.Select(line => itemFromLine(line)).ToList(); 
            }
            catch (Exception e)
            {
                Console.WriteLine(e.Message);
            }

            return itemList;
        }

        public static List<Item> findItemsByName( String name )
        {
            return ItemRepository.importItems().FindAll(i => i.ItemName.Equals(name));
        }

        private static Item itemFromLine( String line )
        {
            String[] fields = line.Split(',');
            return new Item {
                                ID = Convert.ToInt32(fields[ID_FIELD]),
                                ItemName = fields[NAME_FIELD],
                                Price = Convert.ToDouble(fields[PRICE_FIELD])
                            }; 
             
        }
    }
}