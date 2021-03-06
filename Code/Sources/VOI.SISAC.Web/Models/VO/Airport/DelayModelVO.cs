﻿//------------------------------------------------------------------------
// <copyright file="DelayModelVO.cs" company="AACOSTA">
//     Copyright (c) http://aacosta.com.mx/ All rights reserved.
// </copyright>
//----------------------------------------------------------------------

namespace VOI.SISAC.Web.Models.VO.Airport
{
    using Catalog;
    using System.Collections.Generic;

    /// <summary>
    /// Delay Model VO
    /// </summary>
    public class DelayModelVO
    {
        /// <summary>
        /// Delay class
        /// </summary>
        public DelayVO DelayVo { get; set; }

        /// <summary>
        /// Funtional Areas
        /// </summary>
        public IList<FunctionalAreaVO> FuntionalAreasVo { get; set; }
    }
}