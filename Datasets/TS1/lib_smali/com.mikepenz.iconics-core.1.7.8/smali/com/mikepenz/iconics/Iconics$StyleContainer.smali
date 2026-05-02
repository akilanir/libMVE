.class Lcom/mikepenz/iconics/Iconics$StyleContainer;
.super Ljava/lang/Object;
.source "Iconics.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/mikepenz/iconics/Iconics;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "StyleContainer"
.end annotation


# instance fields
.field private endIndex:I

.field private font:Lcom/mikepenz/iconics/typeface/ITypeface;

.field private icon:Ljava/lang/String;

.field private startIndex:I


# direct methods
.method private constructor <init>(IILjava/lang/String;Lcom/mikepenz/iconics/typeface/ITypeface;)V
    .registers 5
    .param p1, "startIndex"    # I
    .param p2, "endIndex"    # I
    .param p3, "icon"    # Ljava/lang/String;
    .param p4, "font"    # Lcom/mikepenz/iconics/typeface/ITypeface;

    .prologue
    .line 414
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 415
    iput p1, p0, Lcom/mikepenz/iconics/Iconics$StyleContainer;->startIndex:I

    .line 416
    iput p2, p0, Lcom/mikepenz/iconics/Iconics$StyleContainer;->endIndex:I

    .line 417
    iput-object p3, p0, Lcom/mikepenz/iconics/Iconics$StyleContainer;->icon:Ljava/lang/String;

    .line 418
    iput-object p4, p0, Lcom/mikepenz/iconics/Iconics$StyleContainer;->font:Lcom/mikepenz/iconics/typeface/ITypeface;

    .line 419
    return-void
.end method

.method synthetic constructor <init>(IILjava/lang/String;Lcom/mikepenz/iconics/typeface/ITypeface;Lcom/mikepenz/iconics/Iconics$1;)V
    .registers 6
    .param p1, "x0"    # I
    .param p2, "x1"    # I
    .param p3, "x2"    # Ljava/lang/String;
    .param p4, "x3"    # Lcom/mikepenz/iconics/typeface/ITypeface;
    .param p5, "x4"    # Lcom/mikepenz/iconics/Iconics$1;

    .prologue
    .line 408
    invoke-direct {p0, p1, p2, p3, p4}, Lcom/mikepenz/iconics/Iconics$StyleContainer;-><init>(IILjava/lang/String;Lcom/mikepenz/iconics/typeface/ITypeface;)V

    return-void
.end method


# virtual methods
.method public getEndIndex()I
    .registers 2

    .prologue
    .line 426
    iget v0, p0, Lcom/mikepenz/iconics/Iconics$StyleContainer;->endIndex:I

    return v0
.end method

.method public getFont()Lcom/mikepenz/iconics/typeface/ITypeface;
    .registers 2

    .prologue
    .line 434
    iget-object v0, p0, Lcom/mikepenz/iconics/Iconics$StyleContainer;->font:Lcom/mikepenz/iconics/typeface/ITypeface;

    return-object v0
.end method

.method public getIcon()Ljava/lang/String;
    .registers 2

    .prologue
    .line 430
    iget-object v0, p0, Lcom/mikepenz/iconics/Iconics$StyleContainer;->icon:Ljava/lang/String;

    return-object v0
.end method

.method public getStartIndex()I
    .registers 2

    .prologue
    .line 422
    iget v0, p0, Lcom/mikepenz/iconics/Iconics$StyleContainer;->startIndex:I

    return v0
.end method
