.class public final Landroid/support/v7/internal/view/menu/MenuWrapperFactory;
.super Ljava/lang/Object;
.source "MenuWrapperFactory.java"


# direct methods
.method private constructor <init>()V
    .registers 1

    .prologue
    .line 30
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 31
    return-void
.end method

.method public static createMenuItemWrapper(Landroid/view/MenuItem;)Landroid/view/MenuItem;
    .registers 3
    .param p0, "frameworkMenuItem"    # Landroid/view/MenuItem;

    .prologue
    .line 41
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x10

    if-lt v0, v1, :cond_d

    .line 42
    new-instance v0, Landroid/support/v7/internal/view/menu/MenuItemWrapperJB;

    invoke-direct {v0, p0}, Landroid/support/v7/internal/view/menu/MenuItemWrapperJB;-><init>(Landroid/view/MenuItem;)V

    move-object p0, v0

    .line 46
    .end local p0    # "frameworkMenuItem":Landroid/view/MenuItem;
    :cond_c
    :goto_c
    return-object p0

    .line 43
    .restart local p0    # "frameworkMenuItem":Landroid/view/MenuItem;
    :cond_d
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0xe

    if-lt v0, v1, :cond_c

    .line 44
    new-instance v0, Landroid/support/v7/internal/view/menu/MenuItemWrapperICS;

    invoke-direct {v0, p0}, Landroid/support/v7/internal/view/menu/MenuItemWrapperICS;-><init>(Landroid/view/MenuItem;)V

    move-object p0, v0

    goto :goto_c
.end method

.method public static createMenuWrapper(Landroid/view/Menu;)Landroid/view/Menu;
    .registers 3
    .param p0, "frameworkMenu"    # Landroid/view/Menu;

    .prologue
    .line 34
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0xe

    if-lt v0, v1, :cond_c

    .line 35
    new-instance v0, Landroid/support/v7/internal/view/menu/MenuWrapperICS;

    invoke-direct {v0, p0}, Landroid/support/v7/internal/view/menu/MenuWrapperICS;-><init>(Landroid/view/Menu;)V

    move-object p0, v0

    .line 37
    .end local p0    # "frameworkMenu":Landroid/view/Menu;
    :cond_c
    return-object p0
.end method

.method public static createSupportMenuItemWrapper(Landroid/view/MenuItem;)Landroid/support/v4/internal/view/SupportMenuItem;
    .registers 3
    .param p0, "frameworkMenuItem"    # Landroid/view/MenuItem;

    .prologue
    .line 66
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x10

    if-lt v0, v1, :cond_c

    .line 67
    new-instance v0, Landroid/support/v7/internal/view/menu/MenuItemWrapperJB;

    invoke-direct {v0, p0}, Landroid/support/v7/internal/view/menu/MenuItemWrapperJB;-><init>(Landroid/view/MenuItem;)V

    .line 69
    :goto_b
    return-object v0

    .line 68
    :cond_c
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0xe

    if-lt v0, v1, :cond_18

    .line 69
    new-instance v0, Landroid/support/v7/internal/view/menu/MenuItemWrapperICS;

    invoke-direct {v0, p0}, Landroid/support/v7/internal/view/menu/MenuItemWrapperICS;-><init>(Landroid/view/MenuItem;)V

    goto :goto_b

    .line 71
    :cond_18
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    invoke-direct {v0}, Ljava/lang/UnsupportedOperationException;-><init>()V

    throw v0
.end method

.method public static createSupportMenuWrapper(Landroid/view/Menu;)Landroid/support/v4/internal/view/SupportMenu;
    .registers 3
    .param p0, "frameworkMenu"    # Landroid/view/Menu;

    .prologue
    .line 50
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0xe

    if-lt v0, v1, :cond_c

    .line 51
    new-instance v0, Landroid/support/v7/internal/view/menu/MenuWrapperICS;

    invoke-direct {v0, p0}, Landroid/support/v7/internal/view/menu/MenuWrapperICS;-><init>(Landroid/view/Menu;)V

    return-object v0

    .line 53
    :cond_c
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    invoke-direct {v0}, Ljava/lang/UnsupportedOperationException;-><init>()V

    throw v0
.end method

.method public static createSupportSubMenuWrapper(Landroid/view/SubMenu;)Landroid/support/v4/internal/view/SupportSubMenu;
    .registers 3
    .param p0, "frameworkSubMenu"    # Landroid/view/SubMenu;

    .prologue
    .line 58
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0xe

    if-lt v0, v1, :cond_c

    .line 59
    new-instance v0, Landroid/support/v7/internal/view/menu/SubMenuWrapperICS;

    invoke-direct {v0, p0}, Landroid/support/v7/internal/view/menu/SubMenuWrapperICS;-><init>(Landroid/view/SubMenu;)V

    return-object v0

    .line 61
    :cond_c
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    invoke-direct {v0}, Ljava/lang/UnsupportedOperationException;-><init>()V

    throw v0
.end method
