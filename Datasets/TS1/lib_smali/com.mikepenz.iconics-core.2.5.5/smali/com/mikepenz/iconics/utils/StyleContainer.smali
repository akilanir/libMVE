.class public Lcom/mikepenz/iconics/utils/StyleContainer;
.super Ljava/lang/Object;
.source "StyleContainer.java"


# instance fields
.field public endIndex:I

.field public font:Lcom/mikepenz/iconics/typeface/ITypeface;

.field public icon:Ljava/lang/String;

.field public startIndex:I

.field public styleSpan:Landroid/text/ParcelableSpan;


# direct methods
.method public constructor <init>(IILandroid/text/ParcelableSpan;)V
    .registers 4
    .param p1, "startIndex"    # I
    .param p2, "endIndex"    # I
    .param p3, "styleSpan"    # Landroid/text/ParcelableSpan;

    .prologue
    .line 21
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 22
    iput p1, p0, Lcom/mikepenz/iconics/utils/StyleContainer;->startIndex:I

    .line 23
    iput p2, p0, Lcom/mikepenz/iconics/utils/StyleContainer;->endIndex:I

    .line 24
    iput-object p3, p0, Lcom/mikepenz/iconics/utils/StyleContainer;->styleSpan:Landroid/text/ParcelableSpan;

    .line 25
    return-void
.end method

.method public constructor <init>(IILjava/lang/String;Lcom/mikepenz/iconics/typeface/ITypeface;)V
    .registers 5
    .param p1, "startIndex"    # I
    .param p2, "endIndex"    # I
    .param p3, "icon"    # Ljava/lang/String;
    .param p4, "font"    # Lcom/mikepenz/iconics/typeface/ITypeface;

    .prologue
    .line 14
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 15
    iput p1, p0, Lcom/mikepenz/iconics/utils/StyleContainer;->startIndex:I

    .line 16
    iput p2, p0, Lcom/mikepenz/iconics/utils/StyleContainer;->endIndex:I

    .line 17
    iput-object p3, p0, Lcom/mikepenz/iconics/utils/StyleContainer;->icon:Ljava/lang/String;

    .line 18
    iput-object p4, p0, Lcom/mikepenz/iconics/utils/StyleContainer;->font:Lcom/mikepenz/iconics/typeface/ITypeface;

    .line 19
    return-void
.end method
