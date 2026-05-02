.class public Lcom/mikepenz/materialdrawer/util/DrawerImageLoader;
.super Ljava/lang/Object;
.source "DrawerImageLoader.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/mikepenz/materialdrawer/util/DrawerImageLoader$IDrawerImageLoader;
    }
.end annotation


# static fields
.field private static SINGLETON:Lcom/mikepenz/materialdrawer/util/DrawerImageLoader;


# instance fields
.field private imageLoader:Lcom/mikepenz/materialdrawer/util/DrawerImageLoader$IDrawerImageLoader;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 13
    const/4 v0, 0x0

    sput-object v0, Lcom/mikepenz/materialdrawer/util/DrawerImageLoader;->SINGLETON:Lcom/mikepenz/materialdrawer/util/DrawerImageLoader;

    return-void
.end method

.method private constructor <init>(Lcom/mikepenz/materialdrawer/util/DrawerImageLoader$IDrawerImageLoader;)V
    .registers 2
    .param p1, "loaderImpl"    # Lcom/mikepenz/materialdrawer/util/DrawerImageLoader$IDrawerImageLoader;

    .prologue
    .line 17
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 18
    iput-object p1, p0, Lcom/mikepenz/materialdrawer/util/DrawerImageLoader;->imageLoader:Lcom/mikepenz/materialdrawer/util/DrawerImageLoader$IDrawerImageLoader;

    .line 19
    return-void
.end method

.method public static getInstance()Lcom/mikepenz/materialdrawer/util/DrawerImageLoader;
    .registers 2

    .prologue
    .line 27
    sget-object v0, Lcom/mikepenz/materialdrawer/util/DrawerImageLoader;->SINGLETON:Lcom/mikepenz/materialdrawer/util/DrawerImageLoader;

    if-nez v0, :cond_10

    .line 28
    new-instance v0, Lcom/mikepenz/materialdrawer/util/DrawerImageLoader;

    new-instance v1, Lcom/mikepenz/materialdrawer/util/DrawerImageLoader$1;

    invoke-direct {v1}, Lcom/mikepenz/materialdrawer/util/DrawerImageLoader$1;-><init>()V

    invoke-direct {v0, v1}, Lcom/mikepenz/materialdrawer/util/DrawerImageLoader;-><init>(Lcom/mikepenz/materialdrawer/util/DrawerImageLoader$IDrawerImageLoader;)V

    sput-object v0, Lcom/mikepenz/materialdrawer/util/DrawerImageLoader;->SINGLETON:Lcom/mikepenz/materialdrawer/util/DrawerImageLoader;

    .line 46
    :cond_10
    sget-object v0, Lcom/mikepenz/materialdrawer/util/DrawerImageLoader;->SINGLETON:Lcom/mikepenz/materialdrawer/util/DrawerImageLoader;

    return-object v0
.end method

.method public static init(Lcom/mikepenz/materialdrawer/util/DrawerImageLoader$IDrawerImageLoader;)Lcom/mikepenz/materialdrawer/util/DrawerImageLoader;
    .registers 2
    .param p0, "loaderImpl"    # Lcom/mikepenz/materialdrawer/util/DrawerImageLoader$IDrawerImageLoader;

    .prologue
    .line 22
    new-instance v0, Lcom/mikepenz/materialdrawer/util/DrawerImageLoader;

    invoke-direct {v0, p0}, Lcom/mikepenz/materialdrawer/util/DrawerImageLoader;-><init>(Lcom/mikepenz/materialdrawer/util/DrawerImageLoader$IDrawerImageLoader;)V

    sput-object v0, Lcom/mikepenz/materialdrawer/util/DrawerImageLoader;->SINGLETON:Lcom/mikepenz/materialdrawer/util/DrawerImageLoader;

    .line 23
    sget-object v0, Lcom/mikepenz/materialdrawer/util/DrawerImageLoader;->SINGLETON:Lcom/mikepenz/materialdrawer/util/DrawerImageLoader;

    return-object v0
.end method


# virtual methods
.method public cancelImage(Landroid/widget/ImageView;)V
    .registers 3
    .param p1, "imageView"    # Landroid/widget/ImageView;

    .prologue
    .line 62
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/util/DrawerImageLoader;->imageLoader:Lcom/mikepenz/materialdrawer/util/DrawerImageLoader$IDrawerImageLoader;

    if-eqz v0, :cond_9

    .line 63
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/util/DrawerImageLoader;->imageLoader:Lcom/mikepenz/materialdrawer/util/DrawerImageLoader$IDrawerImageLoader;

    invoke-interface {v0, p1}, Lcom/mikepenz/materialdrawer/util/DrawerImageLoader$IDrawerImageLoader;->cancel(Landroid/widget/ImageView;)V

    .line 65
    :cond_9
    return-void
.end method

.method public getImageLoader()Lcom/mikepenz/materialdrawer/util/DrawerImageLoader$IDrawerImageLoader;
    .registers 2

    .prologue
    .line 68
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/util/DrawerImageLoader;->imageLoader:Lcom/mikepenz/materialdrawer/util/DrawerImageLoader$IDrawerImageLoader;

    return-object v0
.end method

.method public setImage(Landroid/widget/ImageView;Landroid/net/Uri;)V
    .registers 6
    .param p1, "imageView"    # Landroid/widget/ImageView;
    .param p2, "uri"    # Landroid/net/Uri;

    .prologue
    .line 50
    iget-object v1, p0, Lcom/mikepenz/materialdrawer/util/DrawerImageLoader;->imageLoader:Lcom/mikepenz/materialdrawer/util/DrawerImageLoader$IDrawerImageLoader;

    if-eqz v1, :cond_1d

    .line 51
    iget-object v1, p0, Lcom/mikepenz/materialdrawer/util/DrawerImageLoader;->imageLoader:Lcom/mikepenz/materialdrawer/util/DrawerImageLoader$IDrawerImageLoader;

    invoke-virtual {p1}, Landroid/widget/ImageView;->getContext()Landroid/content/Context;

    move-result-object v2

    invoke-interface {v1, v2}, Lcom/mikepenz/materialdrawer/util/DrawerImageLoader$IDrawerImageLoader;->placeholder(Landroid/content/Context;)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    .line 53
    .local v0, "placeHolder":Landroid/graphics/drawable/Drawable;
    if-nez v0, :cond_18

    .line 54
    invoke-virtual {p1}, Landroid/widget/ImageView;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-static {v1}, Lcom/mikepenz/materialdrawer/util/UIUtils;->getPlaceHolder(Landroid/content/Context;)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    .line 57
    :cond_18
    iget-object v1, p0, Lcom/mikepenz/materialdrawer/util/DrawerImageLoader;->imageLoader:Lcom/mikepenz/materialdrawer/util/DrawerImageLoader$IDrawerImageLoader;

    invoke-interface {v1, p1, p2, v0}, Lcom/mikepenz/materialdrawer/util/DrawerImageLoader$IDrawerImageLoader;->set(Landroid/widget/ImageView;Landroid/net/Uri;Landroid/graphics/drawable/Drawable;)V

    .line 59
    .end local v0    # "placeHolder":Landroid/graphics/drawable/Drawable;
    :cond_1d
    return-void
.end method

.method public setImageLoader(Lcom/mikepenz/materialdrawer/util/DrawerImageLoader$IDrawerImageLoader;)V
    .registers 2
    .param p1, "imageLoader"    # Lcom/mikepenz/materialdrawer/util/DrawerImageLoader$IDrawerImageLoader;

    .prologue
    .line 72
    iput-object p1, p0, Lcom/mikepenz/materialdrawer/util/DrawerImageLoader;->imageLoader:Lcom/mikepenz/materialdrawer/util/DrawerImageLoader$IDrawerImageLoader;

    .line 73
    return-void
.end method
