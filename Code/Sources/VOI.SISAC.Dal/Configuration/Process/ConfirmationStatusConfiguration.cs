﻿//------------------------------------------------------------------------
// <copyright file="ConfirmationStatusConfiguration.cs" company="AACOSTA">
//     Copyright (c) http://aacosta.com.mx/ All rights reserved.
// </copyright>
//------------------------------------------------------------------------

namespace VOI.SISAC.Dal.Configuration.Process
{
    using Entities.Process;
    using System.Data.Entity.ModelConfiguration;

    /// <summary>
    /// ConfirmationStatusConfiguration Class
    /// </summary>
    public class ConfirmationStatusConfiguration : EntityTypeConfiguration<ConfirmationStatus>
    {
        /// <summary>
        /// Constructor
        /// </summary>
        public ConfirmationStatusConfiguration()
        {
            Property(e => e.ConfirmationStatusCode)
            .IsUnicode(false);

            Property(e => e.ConfirmationStatusName)
            .IsUnicode(false);
        }
    }
}
