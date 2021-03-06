﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using VOI.SISAC.Entities.Security;

namespace VOI.SISAC.Business.Dto.Security
{
    public class MenuDto
    {
        /// <summary>
        /// Gets or sets the menu code.
        /// </summary>
        /// <value>
        /// The menu code.
        /// </value>
        public string MenuCode { get; set; }

        /// <summary>
        /// Gets or sets the name of the menu.
        /// </summary>
        /// <value>
        /// The name of the menu.
        /// </value>
        public string MenuName { get; set; }

        /// <summary>
        /// Gets or sets a value indicating whether this instance is parent.
        /// </summary>
        /// <value>
        ///   <c>true</c> if this instance is parent; otherwise, <c>false</c>.
        /// </value>
        public bool IsParent { get; set; }

        /// <summary>
        /// Gets or sets the parent code.
        /// </summary>
        /// <value>
        /// The parent code.
        /// </value>
        public string ParentCode { get; set; }

        /// <summary>
        /// Gets or sets the module.
        /// </summary>
        /// <value>
        /// The module.
        /// </value>
        public ICollection<ModuleDto> Module { get; set; }
    }
}
