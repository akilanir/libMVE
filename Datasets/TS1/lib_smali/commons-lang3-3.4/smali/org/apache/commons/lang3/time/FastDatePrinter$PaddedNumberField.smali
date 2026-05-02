.class Lorg/apache/commons/lang3/time/FastDatePrinter$PaddedNumberField;
.super Ljava/lang/Object;
.source "FastDatePrinter.java"

# interfaces
.implements Lorg/apache/commons/lang3/time/FastDatePrinter$NumberRule;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/apache/commons/lang3/time/FastDatePrinter;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "PaddedNumberField"
.end annotation


# instance fields
.field private final mField:I

.field private final mSize:I


# direct methods
.method constructor <init>(II)V
    .registers 4
    .param p1, "field"    # I
    .param p2, "size"    # I

    .prologue
    .line 848
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 849
    const/4 v0, 0x3

    if-ge p2, v0, :cond_c

    .line 851
    new-instance v0, Ljava/lang/IllegalArgumentException;

    invoke-direct {v0}, Ljava/lang/IllegalArgumentException;-><init>()V

    throw v0

    .line 853
    :cond_c
    iput p1, p0, Lorg/apache/commons/lang3/time/FastDatePrinter$PaddedNumberField;->mField:I

    .line 854
    iput p2, p0, Lorg/apache/commons/lang3/time/FastDatePrinter$PaddedNumberField;->mSize:I

    .line 855
    return-void
.end method


# virtual methods
.method public final appendTo(Ljava/lang/StringBuffer;I)V
    .registers 6
    .param p1, "buffer"    # Ljava/lang/StringBuffer;
    .param p2, "value"    # I

    .prologue
    .line 879
    const/4 v0, 0x0

    .local v0, "digit":I
    :goto_1
    iget v2, p0, Lorg/apache/commons/lang3/time/FastDatePrinter$PaddedNumberField;->mSize:I

    if-ge v0, v2, :cond_d

    .line 880
    const/16 v2, 0x30

    invoke-virtual {p1, v2}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 879
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    .line 883
    :cond_d
    invoke-virtual {p1}, Ljava/lang/StringBuffer;->length()I

    move-result v1

    .line 884
    .local v1, "index":I
    :goto_11
    if-lez p2, :cond_20

    .line 885
    add-int/lit8 v1, v1, -0x1

    rem-int/lit8 v2, p2, 0xa

    add-int/lit8 v2, v2, 0x30

    int-to-char v2, v2

    invoke-virtual {p1, v1, v2}, Ljava/lang/StringBuffer;->setCharAt(IC)V

    .line 884
    div-int/lit8 p2, p2, 0xa

    goto :goto_11

    .line 887
    :cond_20
    return-void
.end method

.method public appendTo(Ljava/lang/StringBuffer;Ljava/util/Calendar;)V
    .registers 4
    .param p1, "buffer"    # Ljava/lang/StringBuffer;
    .param p2, "calendar"    # Ljava/util/Calendar;

    .prologue
    .line 870
    iget v0, p0, Lorg/apache/commons/lang3/time/FastDatePrinter$PaddedNumberField;->mField:I

    invoke-virtual {p2, v0}, Ljava/util/Calendar;->get(I)I

    move-result v0

    invoke-virtual {p0, p1, v0}, Lorg/apache/commons/lang3/time/FastDatePrinter$PaddedNumberField;->appendTo(Ljava/lang/StringBuffer;I)V

    .line 871
    return-void
.end method

.method public estimateLength()I
    .registers 2

    .prologue
    .line 862
    iget v0, p0, Lorg/apache/commons/lang3/time/FastDatePrinter$PaddedNumberField;->mSize:I

    return v0
.end method
