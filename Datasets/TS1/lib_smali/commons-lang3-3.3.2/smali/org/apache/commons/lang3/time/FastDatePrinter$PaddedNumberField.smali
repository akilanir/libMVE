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
    .line 821
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 822
    const/4 v0, 0x3

    if-ge p2, v0, :cond_c

    .line 824
    new-instance v0, Ljava/lang/IllegalArgumentException;

    invoke-direct {v0}, Ljava/lang/IllegalArgumentException;-><init>()V

    throw v0

    .line 826
    :cond_c
    iput p1, p0, Lorg/apache/commons/lang3/time/FastDatePrinter$PaddedNumberField;->mField:I

    .line 827
    iput p2, p0, Lorg/apache/commons/lang3/time/FastDatePrinter$PaddedNumberField;->mSize:I

    .line 828
    return-void
.end method


# virtual methods
.method public final appendTo(Ljava/lang/StringBuffer;I)V
    .registers 10
    .param p1, "buffer"    # Ljava/lang/StringBuffer;
    .param p2, "value"    # I

    .prologue
    const/16 v6, 0x30

    .line 851
    const/16 v2, 0x64

    if-ge p2, v2, :cond_22

    .line 852
    iget v1, p0, Lorg/apache/commons/lang3/time/FastDatePrinter$PaddedNumberField;->mSize:I

    .local v1, "i":I
    :goto_8
    add-int/lit8 v1, v1, -0x1

    const/4 v2, 0x2

    if-lt v1, v2, :cond_11

    .line 853
    invoke-virtual {p1, v6}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    goto :goto_8

    .line 855
    :cond_11
    div-int/lit8 v2, p2, 0xa

    add-int/lit8 v2, v2, 0x30

    int-to-char v2, v2

    invoke-virtual {p1, v2}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 856
    rem-int/lit8 v2, p2, 0xa

    add-int/lit8 v2, v2, 0x30

    int-to-char v2, v2

    invoke-virtual {p1, v2}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 870
    :goto_21
    return-void

    .line 859
    .end local v1    # "i":I
    :cond_22
    const/16 v2, 0x3e8

    if-ge p2, v2, :cond_31

    .line 860
    const/4 v0, 0x3

    .line 865
    .local v0, "digits":I
    :goto_27
    iget v1, p0, Lorg/apache/commons/lang3/time/FastDatePrinter$PaddedNumberField;->mSize:I

    .restart local v1    # "i":I
    :goto_29
    add-int/lit8 v1, v1, -0x1

    if-lt v1, v0, :cond_46

    .line 866
    invoke-virtual {p1, v6}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    goto :goto_29

    .line 862
    .end local v0    # "digits":I
    .end local v1    # "i":I
    :cond_31
    const/4 v2, -0x1

    if-le p2, v2, :cond_44

    const/4 v2, 0x1

    :goto_35
    const-string v3, "Negative values should not be possible"

    int-to-long v4, p2

    invoke-static {v2, v3, v4, v5}, Lorg/apache/commons/lang3/Validate;->isTrue(ZLjava/lang/String;J)V

    .line 863
    invoke-static {p2}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v0

    .restart local v0    # "digits":I
    goto :goto_27

    .line 862
    .end local v0    # "digits":I
    :cond_44
    const/4 v2, 0x0

    goto :goto_35

    .line 868
    .restart local v0    # "digits":I
    .restart local v1    # "i":I
    :cond_46
    invoke-static {p2}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    goto :goto_21
.end method

.method public appendTo(Ljava/lang/StringBuffer;Ljava/util/Calendar;)V
    .registers 4
    .param p1, "buffer"    # Ljava/lang/StringBuffer;
    .param p2, "calendar"    # Ljava/util/Calendar;

    .prologue
    .line 843
    iget v0, p0, Lorg/apache/commons/lang3/time/FastDatePrinter$PaddedNumberField;->mField:I

    invoke-virtual {p2, v0}, Ljava/util/Calendar;->get(I)I

    move-result v0

    invoke-virtual {p0, p1, v0}, Lorg/apache/commons/lang3/time/FastDatePrinter$PaddedNumberField;->appendTo(Ljava/lang/StringBuffer;I)V

    .line 844
    return-void
.end method

.method public estimateLength()I
    .registers 2

    .prologue
    .line 835
    const/4 v0, 0x4

    return v0
.end method
