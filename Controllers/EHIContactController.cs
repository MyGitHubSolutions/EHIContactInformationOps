
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using EHIContactInformation.Context;

namespace EHIContactInformation.Controllers
{
    public class EHIContactController : Controller
    {
        // GET: EHIContact
        // Object of Database Entities
        EvolentHealthEntities objDbEntities = new EvolentHealthEntities();
        public ActionResult EHIContact(tblContactInformation objEdit)
        {
            if (objEdit != null)
                return View(objEdit); // Get data for Edit Action
            else
                return View(); // Open normal view for Add Action
        }

        [HttpPost]
        public ActionResult AddEHIContact(tblContactInformation model)
        {
            //Object of Database Table Contact Information
            tblContactInformation objTbl = new tblContactInformation();

            if (ModelState.IsValid)
            {
                objTbl.ContactID = model.ContactID;
                objTbl.FirstName = model.FirstName;
                objTbl.LastName = model.LastName;
                objTbl.Email = model.Email;
                objTbl.Status = model.Status;
                objTbl.PhoneNumber = model.PhoneNumber;

                if (model.ContactID == 0)
                {
                    objDbEntities.tblContactInformations.Add(objTbl);
                    objDbEntities.SaveChanges();
                }
                else
                {
                    objDbEntities.Entry(objTbl).State = EntityState.Modified;
                    objDbEntities.SaveChanges();
                }                
            }
            ModelState.Clear();

            return View("EHIContact");
        }

        public ActionResult ListContact()
        {
            var listContactInfo = objDbEntities.tblContactInformations.ToList();
            return View(listContactInfo);
        }

        public ActionResult DeleteContact(int contactId)
        {
            var listContactInfo = objDbEntities.tblContactInformations.Where(x => x.ContactID == contactId).First();
            objDbEntities.tblContactInformations.Remove(listContactInfo);
            objDbEntities.SaveChanges();

            //Retrive list
            var reListContact = objDbEntities.tblContactInformations.ToList();

            //Fresh view with retrived data
            return View("ListContact", reListContact);
        }
    }
}