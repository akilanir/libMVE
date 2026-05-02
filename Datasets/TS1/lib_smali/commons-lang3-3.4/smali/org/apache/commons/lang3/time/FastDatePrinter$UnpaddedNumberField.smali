.class Lorg/apache/commons/lang3/time/FastDatePrinter$UnpaddedNumberField;
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
    name = "UnpaddedNumberField"
.end annotation


# instance fields
.field private final mField:I


# direct methods
.method constructor <init>(I)V
    .registers 2
    .param p1, "field"    # I

    .prologue
    .line 757
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 758
    iput p1, p0, Lorg/apache/commons/lang3/time/FastDatePrinter$UnpaddedNumberField;->mField:I

    .line 759
    return-void
.end method


# virtual methods
.method public final appendTo(Ljava/lang/StringBuffer;I)V
    .registers 4
    .param p1, "buffer"    # Ljava/lang/StringBuffer;
    .param p2, "value"    # I

    .prologue
    .line 782
    const/16 v0, 0xa

    if-ge p2, v0, :cond_b

    .line 783
    add-int/lit8 v0, p2, 0x30

    int-to-char v0, v0

    invoke-virtual {p1, v0}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 789
    :goto_a
    return-void

    .line 784
    :cond_b
    const/16 v0, 0x64

    if-ge p2, v0, :cond_13

    .line 785
    # invokes: Lorg/apache/commons/lang3/time/FastDatePrinter;->appendDigits(Ljava/lang/StringBuffer;I)V
    invoke-static {p1, p2}, Lorg/apache/commons/lang3/time/FastDatePrinter;->access$000(Ljava/lang/StringBuffer;I)V

    goto :goto_a

    .line 787
    :cond_13
    invoke-virtual {p1, p2}, Ljava/lang/StringBuffer;->append(I)Ljava/lang/StringBuffer;

    goto :goto_a
.end method

.method public appendTo(Ljava/lang/StringBuffer;Ljava/util/Calendar;)V
    .registers 4
    .param p1, "buffer"    # Ljava/lang/StringBuffer;
    .param p2, "calendar"    # Ljava/util/Calendar;

    .prologue
    .line 774
    iget v0, p0, Lorg/apache/commons/lang3/time/FastDatePrinter$UnpaddedNumberField;->mField:I

    invoke-virtual {p2, v0}, Ljava/util/Calendar;->get(I)I

    move-result v0

    invoke-virtual {p0, p1, v0}, Lorg/apache/commons/lang3/time/FastDatePrinter$UnpaddedNumberField;->appendTo(Ljava/lang/StringBuffer;I)V

    .line 775
    return-void
.end method

.method public estimateLength()I
    .registers 2

    .prologue
    .line 766
    const/4 v0, 0x4

    return v0
.end method
