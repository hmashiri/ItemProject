using System;
using TestSkillsProject.Models;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;

namespace TestSkillsProject.Controllers
{
    public class ItemController : ApiController
    {
 
        public IEnumerable<Item> GetAllItems()
        {
            System.Diagnostics.Debug.WriteLine("\n\n\ninside getHighestItems\n\n\n");
            return ItemRepository.importItems(); 
        }
        
        [Route("api/item/highest")]
        public IEnumerable<Item> getHighestItems()
        {
            return (from item in ItemRepository.importItems()
                    group item by item.ItemName
                            into groups
                    select groups.OrderByDescending(i => i.Price).First()).ToList();
        }

        [Route("api/item/lowest")]
        public IEnumerable<Item> getLowestItems()
        {
            return (from item in ItemRepository.importItems()
                    group item by item.ItemName
                            into groups
                    select groups.OrderBy(i => i.Price).First()).ToList();
        }

        public IHttpActionResult GetItem(String ItemName)
        {
            return Ok( ItemRepository.findItemsByName(ItemName).OrderBy(i => i.Price).First() );
        }
    }
}
