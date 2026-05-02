.class public abstract Lcom/mikepenz/materialdrawer/util/AbstractDrawerImageLoader;
.super Ljava/lang/Object;
.source "AbstractDrawerImageLoader.java"

# interfaces
.implements Lcom/mikepenz/materialdrawer/util/DrawerImageLoader$IDrawerImageLoader;


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 9
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public cancel(Landroid/widget/ImageView;)V
    .registers 2
    .param p1, "imageView"    # Landroid/widget/ImageView;

    .prologue
    .line 18
    return-void
.end method

.method public placeholder(Landroid/content/Context;)Landroid/graphics/drawable/Drawable;
    .registers 3
    .param p1, "ctx"    # Landroid/content/Context;

    .prologue
    .line 22
    invoke-static {p1}, Lcom/mikepenz/materialdrawer/util/DrawerUIUtils;->getPlaceHolder(Landroid/content/Context;)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    return-object v0
.end method

.method public placeholder(Landroid/content/Context;Ljava/lang/String;)Landroid/graphics/drawable/Drawable;
    .registers 4
    .param p1, "ctx"    # Landroid/content/Context;
    .param p2, "tag"    # Ljava/lang/String;

    .prologue
    .line 27
    invoke-virtual {p0, p1}, Lcom/mikepenz/materialdrawer/util/AbstractDrawerImageLoader;->placeholder(Landroid/content/Context;)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    return-object v0
.end method

.method public set(Landroid/widget/ImageView;Landroid/net/Uri;Landroid/graphics/drawable/Drawable;)V
    .registers 6
    .param p1, "imageView"    # Landroid/widget/ImageView;
    .param p2, "uri"    # Landroid/net/Uri;
    .param p3, "placeholder"    # Landroid/graphics/drawable/Drawable;

    .prologue
    .line 13
    const-string v0, "MaterialDrawer"

    const-string v1, "you have not specified a ImageLoader implementation through the DrawerImageLoader.init(IDrawerImageLoader) method"

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 14
    return-void
.end method
