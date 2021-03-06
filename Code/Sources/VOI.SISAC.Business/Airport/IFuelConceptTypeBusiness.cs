﻿//--------------------------------------------------------------------
// <copyright file="IFuelConceptTypeBusiness.cs" company="AACOSTA">
//     Copyright (c) http://aacosta.com.mx/ All rights reserved.
// </copyright>
//--------------------------------------------------------------------

namespace VOI.SISAC.Business.Airport
{
    using Dto.Airports;
    using System.Collections.Generic;

    /// <summary>
    /// IFuelConceptTypeBusiness
    /// </summary>
    public interface IFuelConceptTypeBusiness
    {
        /// <summary>
        /// Gets all FuelConceptTypes.
        /// </summary>
        /// <returns>List of FuelConceptTypes.</returns>
        IList<FuelConceptTypeDto> GetAllFuelConceptTypes();
    }
}
