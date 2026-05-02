.class final Lcom/mikepenz/materialdrawer/util/DrawerImageLoader$1;
.super Ljava/lang/Object;
.source "DrawerImageLoader.java"

# interfaces
.implements Lcom/mikepenz/materialdrawer/util/DrawerImageLoader$IDrawerImageLoader;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/mikepenz/materialdrawer/util/DrawerImageLoader;->getInstance()Lcom/mikepenz/materialdrawer/util/DrawerImageLoader;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation


# direct methods
.method constructor <init>()V
    .registers 1

    .prologue
    .line 28
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public cancel(Landroid/widget/ImageView;)V
    .registers 2
    .param p1, "imageView"    # Landroid/widget/ImageView;

    .prologue
    .line 38
    return-void
.end method

.method public placeholder(Landroid/content/Context;)Landroid/graphics/drawable/Drawable;
    .registers 3
    .param p1, "ctx"    # Landroid/content/Context;

    .prologue
    .line 42
    const/4 v0, 0x0

    return-object v0
.end method

.method public set(Landroid/widget/ImageView;Landroid/net/Uri;Landroid/graphics/drawable/Drawable;)V
    .registers 6
    .param p1, "imageView"    # Landroid/widget/ImageView;
    .param p2, "uri"    # Landroid/net/Uri;
    .param p3, "placeholder"    # Landroid/graphics/drawable/Drawable;

    .prologue
    .line 32
    const-string v0, "MaterialDrawer"

    const-string v1, "you have not specified a ImageLoader implementation through the DrawerImageLoader.init(IDrawerImageLoader) method"

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 33
    return-void
.end method
