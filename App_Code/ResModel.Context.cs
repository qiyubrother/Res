﻿//------------------------------------------------------------------------------
// <auto-generated>
//     此代码已从模板生成。
//
//     手动更改此文件可能导致应用程序出现意外的行为。
//     如果重新生成代码，将覆盖对此文件的手动更改。
// </auto-generated>
//------------------------------------------------------------------------------

using System;
using System.Data.Entity;
using System.Data.Entity.Infrastructure;

public partial class ResEntities : DbContext
{
    public ResEntities()
        : base("name=ResEntities")
    {
    }

    protected override void OnModelCreating(DbModelBuilder modelBuilder)
    {
        throw new UnintentionalCodeFirstException();
    }

    public virtual DbSet<Resource> Resource { get; set; }
    public virtual DbSet<ResourceClick> ResourceClick { get; set; }
    public virtual DbSet<ResourceGroup> ResourceGroup { get; set; }
    public virtual DbSet<ResourceGroupTotalClick> ResourceGroupTotalClick { get; set; }
    public virtual DbSet<ResourceLink> ResourceLink { get; set; }
    public virtual DbSet<ResourceSubGroup> ResourceSubGroup { get; set; }
    public virtual DbSet<SearchKey> SearchKey { get; set; }
    public virtual DbSet<Source> Source { get; set; }
}
