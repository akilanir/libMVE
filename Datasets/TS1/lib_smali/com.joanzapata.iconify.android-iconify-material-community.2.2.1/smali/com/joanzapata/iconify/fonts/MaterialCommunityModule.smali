.class public Lcom/joanzapata/iconify/fonts/MaterialCommunityModule;
.super Ljava/lang/Object;
.source "MaterialCommunityModule.java"

# interfaces
.implements Lcom/joanzapata/iconify/IconFontDescriptor;


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 6
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public characters()[Lcom/joanzapata/iconify/Icon;
    .registers 2

    .prologue
    .line 15
    invoke-static {}, Lcom/joanzapata/iconify/fonts/MaterialCommunityIcons;->values()[Lcom/joanzapata/iconify/fonts/MaterialCommunityIcons;

    move-result-object v0

    return-object v0
.end method

.method public ttfFileName()Ljava/lang/String;
    .registers 2

    .prologue
    .line 10
    const-string v0, "iconify/android-iconify-material-community.ttf"

    return-object v0
.end method
