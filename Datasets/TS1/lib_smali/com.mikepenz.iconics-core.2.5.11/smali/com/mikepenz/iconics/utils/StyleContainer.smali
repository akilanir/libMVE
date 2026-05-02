.class public Lcom/mikepenz/iconics/utils/StyleContainer;
.super Ljava/lang/Object;
.source "StyleContainer.java"


# instance fields
.field public endIndex:I

.field public font:Lcom/mikepenz/iconics/typeface/ITypeface;

.field public icon:Ljava/lang/String;

.field public span:Landroid/text/ParcelableSpan;

.field public startIndex:I

.field public style:Landroid/text/style/CharacterStyle;


# direct methods
.method public constructor <init>(IILandroid/text/ParcelableSpan;)V
    .registers 4
    .param p1, "startIndex"    # I
    .param p2, "endIndex"    # I
    .param p3, "span"    # Landroid/text/ParcelableSpan;

    .prologue
    .line 23
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 24
    iput p1, p0, Lcom/mikepenz/iconics/utils/StyleContainer;->startIndex:I

    .line 25
    iput p2, p0, Lcom/mikepenz/iconics/utils/StyleContainer;->endIndex:I

    .line 26
    iput-object p3, p0, Lcom/mikepenz/iconics/utils/StyleContainer;->span:Landroid/text/ParcelableSpan;

    .line 27
    return-void
.end method

.method public constructor <init>(IILandroid/text/style/CharacterStyle;)V
    .registers 4
    .param p1, "startIndex"    # I
    .param p2, "endIndex"    # I
    .param p3, "style"    # Landroid/text/style/CharacterStyle;

    .prologue
    .line 29
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 30
    iput p1, p0, Lcom/mikepenz/iconics/utils/StyleContainer;->startIndex:I

    .line 31
    iput p2, p0, Lcom/mikepenz/iconics/utils/StyleContainer;->endIndex:I

    .line 32
    iput-object p3, p0, Lcom/mikepenz/iconics/utils/StyleContainer;->style:Landroid/text/style/CharacterStyle;

    .line 33
    return-void
.end method

.method public constructor <init>(IILjava/lang/String;Lcom/mikepenz/iconics/typeface/ITypeface;)V
    .registers 5
    .param p1, "startIndex"    # I
    .param p2, "endIndex"    # I
    .param p3, "icon"    # Ljava/lang/String;
    .param p4, "font"    # Lcom/mikepenz/iconics/typeface/ITypeface;

    .prologue
    .line 16
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 17
    iput p1, p0, Lcom/mikepenz/iconics/utils/StyleContainer;->startIndex:I

    .line 18
    iput p2, p0, Lcom/mikepenz/iconics/utils/StyleContainer;->endIndex:I

    .line 19
    iput-object p3, p0, Lcom/mikepenz/iconics/utils/StyleContainer;->icon:Ljava/lang/String;

    .line 20
    iput-object p4, p0, Lcom/mikepenz/iconics/utils/StyleContainer;->font:Lcom/mikepenz/iconics/typeface/ITypeface;

    .line 21
    return-void
.end method
