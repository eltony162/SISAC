﻿//------------------------------------------------------------------------
// <copyright file="ToleranceTypeConfiguration.cs" company="AACOSTA">
//     Copyright (c) http://aacosta.com.mx/ All rights reserved.
// </copyright>
//------------------------------------------------------------------------

namespace VOI.SISAC.Dal.Configuration.Catalog
{
    using System.Data.Entity.ModelConfiguration;
    using VOI.SISAC.Entities.Catalog;

    public class ToleranceTypeConfiguration : EntityTypeConfiguration<ToleranceType>
    {
        /// <summary>
        /// Constructor
        /// </summary>
        public ToleranceTypeConfiguration()
        {
            Property(e => e.ToleranceTypeCode)
                .IsUnicode(false);

            Property(e => e.ToleranceTypeName)
                .IsUnicode(false);
        }
    }
}
