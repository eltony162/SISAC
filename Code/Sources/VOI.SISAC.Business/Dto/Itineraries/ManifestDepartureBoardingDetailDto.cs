﻿//------------------------------------------------------------------------
// <copyright file="ManifestDepartureBoardingDetailDto.cs" company="AACOSTA">
//     Copyright (c) http://aacosta.com.mx/ All rights reserved.
// </copyright>
//----------------------------------------------------------------------


namespace VOI.SISAC.Business.Dto.Itineraries
{
    using System;

    /// <summary>
    /// ManifestDepartureBoardingDetailDto
    /// </summary>
    public class ManifestDepartureBoardingDetailDto
    {
        /// <summary>
        /// Gets or sets the boarding detail identifier.
        /// </summary>
        /// <value>
        /// The boarding detail identifier.
        /// </value>
        public long BoardingDetailID { get; set; }

        /// <summary>
        /// Gets or sets the boarding identifier.
        /// </summary>
        /// <value>
        /// The boarding identifier.
        /// </value>
        public long BoardingID { get; set; }

        /// <summary>
        /// Gets or sets the compartment type identifier.
        /// </summary>
        /// <value>
        /// The compartment type identifier.
        /// </value>
        public int CompartmentTypeID { get; set; }

        /// <summary>
        /// Gets or sets the luggage quantity.
        /// </summary>
        /// <value>
        /// The luggage quantity.
        /// </value>
        public int? LuggageQuantity { get; set; }

        /// <summary>
        /// Gets or sets the luggage KGS.
        /// </summary>
        /// <value>
        /// The luggage KGS.
        /// </value>
        public decimal? LuggageKgs { get; set; }

        /// <summary>
        /// Gets or sets the charge quantity.
        /// </summary>
        /// <value>
        /// The charge quantity.
        /// </value>
        public int? ChargeQuantity { get; set; }

        /// <summary>
        /// Gets or sets the charge KGS.
        /// </summary>
        /// <value>
        /// The charge KGS.
        /// </value>
        public decimal? ChargeKgs { get; set; }

        /// <summary>
        /// Gets or sets the remarks.
        /// </summary>
        /// <value>
        /// The remarks.
        /// </value>
        public string Remarks { get; set; }

        /// <summary>
        /// Gets or sets the ramp responsible.
        /// </summary>
        /// <value>
        /// The ramp responsible.
        /// </value>
        public string RampResponsible { get; set; }

        /// <summary>
        /// Gets or sets the aor user identifier.
        /// </summary>
        /// <value>
        /// The aor user identifier.
        /// </value>
        public int AorUserID { get; set; }

        /// <summary>
        /// Gets or sets the creation date.
        /// </summary>
        /// <value>
        /// The creation date.
        /// </value>
        public DateTime CreationDate { get; set; }


        /// <summary>
        /// Gets or sets the name of the compartment type.
        /// </summary>
        /// <value>
        /// The name of the compartment type.
        /// </value>
        public string CompartmentTypeName { get; set; }

        /// <summary>
        /// Gets or sets the maximum weight.
        /// </summary>
        /// <value>
        /// The maximum weight.
        /// </value>
        public decimal MaximumWeight { get; set; }

        /// <summary>
        /// Gets or sets the manifest departure boarding.
        /// </summary>
        /// <value>
        /// The manifest departure boarding.
        /// </value>
        //public ManifestDepartureBoardingDto ManifestDepartureBoarding { get; set; }
    }
}
