.class Lcom/google/common/io/BaseEncoding$StandardBaseEncoding$2;
.super Ljava/lang/Object;
.source "BaseEncoding.java"

# interfaces
.implements Lcom/google/common/io/GwtWorkarounds$ByteInput;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/google/common/io/BaseEncoding$StandardBaseEncoding;->decodingStream(Lcom/google/common/io/GwtWorkarounds$CharInput;)Lcom/google/common/io/GwtWorkarounds$ByteInput;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field bitBuffer:I

.field bitBufferLength:I

.field hitPadding:Z

.field final paddingMatcher:Lcom/google/common/base/CharMatcher;

.field readChars:I

.field final synthetic this$0:Lcom/google/common/io/BaseEncoding$StandardBaseEncoding;

.field final synthetic val$reader:Lcom/google/common/io/GwtWorkarounds$CharInput;


# direct methods
.method constructor <init>(Lcom/google/common/io/BaseEncoding$StandardBaseEncoding;Lcom/google/common/io/GwtWorkarounds$CharInput;)V
    .registers 4

    .prologue
    const/4 v0, 0x0

    .line 685
    iput-object p1, p0, Lcom/google/common/io/BaseEncoding$StandardBaseEncoding$2;->this$0:Lcom/google/common/io/BaseEncoding$StandardBaseEncoding;

    iput-object p2, p0, Lcom/google/common/io/BaseEncoding$StandardBaseEncoding$2;->val$reader:Lcom/google/common/io/GwtWorkarounds$CharInput;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 686
    iput v0, p0, Lcom/google/common/io/BaseEncoding$StandardBaseEncoding$2;->bitBuffer:I

    .line 687
    iput v0, p0, Lcom/google/common/io/BaseEncoding$StandardBaseEncoding$2;->bitBufferLength:I

    .line 688
    iput v0, p0, Lcom/google/common/io/BaseEncoding$StandardBaseEncoding$2;->readChars:I

    .line 689
    iput-boolean v0, p0, Lcom/google/common/io/BaseEncoding$StandardBaseEncoding$2;->hitPadding:Z

    .line 690
    iget-object v0, p0, Lcom/google/common/io/BaseEncoding$StandardBaseEncoding$2;->this$0:Lcom/google/common/io/BaseEncoding$StandardBaseEncoding;

    invoke-virtual {v0}, Lcom/google/common/io/BaseEncoding$StandardBaseEncoding;->padding()Lcom/google/common/base/CharMatcher;

    move-result-object v0

    iput-object v0, p0, Lcom/google/common/io/BaseEncoding$StandardBaseEncoding$2;->paddingMatcher:Lcom/google/common/base/CharMatcher;

    return-void
.end method


# virtual methods
.method public close()V
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 728
    iget-object v0, p0, Lcom/google/common/io/BaseEncoding$StandardBaseEncoding$2;->val$reader:Lcom/google/common/io/GwtWorkarounds$CharInput;

    invoke-interface {v0}, Lcom/google/common/io/GwtWorkarounds$CharInput;->close()V

    .line 729
    return-void
.end method

.method public read()I
    .registers 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v5, 0x1

    const/4 v2, -0x1

    .line 695
    :cond_2
    :goto_2
    iget-object v3, p0, Lcom/google/common/io/BaseEncoding$StandardBaseEncoding$2;->val$reader:Lcom/google/common/io/GwtWorkarounds$CharInput;

    invoke-interface {v3}, Lcom/google/common/io/GwtWorkarounds$CharInput;->read()I

    move-result v1

    .line 696
    .local v1, "readChar":I
    if-ne v1, v2, :cond_37

    .line 697
    iget-boolean v3, p0, Lcom/google/common/io/BaseEncoding$StandardBaseEncoding$2;->hitPadding:Z

    if-nez v3, :cond_e1

    iget-object v3, p0, Lcom/google/common/io/BaseEncoding$StandardBaseEncoding$2;->this$0:Lcom/google/common/io/BaseEncoding$StandardBaseEncoding;

    # getter for: Lcom/google/common/io/BaseEncoding$StandardBaseEncoding;->alphabet:Lcom/google/common/io/BaseEncoding$Alphabet;
    invoke-static {v3}, Lcom/google/common/io/BaseEncoding$StandardBaseEncoding;->access$000(Lcom/google/common/io/BaseEncoding$StandardBaseEncoding;)Lcom/google/common/io/BaseEncoding$Alphabet;

    move-result-object v3

    iget v4, p0, Lcom/google/common/io/BaseEncoding$StandardBaseEncoding$2;->readChars:I

    invoke-virtual {v3, v4}, Lcom/google/common/io/BaseEncoding$Alphabet;->isValidPaddingStartPosition(I)Z

    move-result v3

    if-nez v3, :cond_e1

    .line 698
    new-instance v2, Lcom/google/common/io/BaseEncoding$DecodingException;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Invalid input length "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget v4, p0, Lcom/google/common/io/BaseEncoding$StandardBaseEncoding$2;->readChars:I

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Lcom/google/common/io/BaseEncoding$DecodingException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 702
    :cond_37
    iget v3, p0, Lcom/google/common/io/BaseEncoding$StandardBaseEncoding$2;->readChars:I

    add-int/lit8 v3, v3, 0x1

    iput v3, p0, Lcom/google/common/io/BaseEncoding$StandardBaseEncoding$2;->readChars:I

    .line 703
    int-to-char v0, v1

    .line 704
    .local v0, "ch":C
    iget-object v3, p0, Lcom/google/common/io/BaseEncoding$StandardBaseEncoding$2;->paddingMatcher:Lcom/google/common/base/CharMatcher;

    invoke-virtual {v3, v0}, Lcom/google/common/base/CharMatcher;->matches(C)Z

    move-result v3

    if-eqz v3, :cond_7c

    .line 705
    iget-boolean v3, p0, Lcom/google/common/io/BaseEncoding$StandardBaseEncoding$2;->hitPadding:Z

    if-nez v3, :cond_79

    iget v3, p0, Lcom/google/common/io/BaseEncoding$StandardBaseEncoding$2;->readChars:I

    if-eq v3, v5, :cond_5e

    iget-object v3, p0, Lcom/google/common/io/BaseEncoding$StandardBaseEncoding$2;->this$0:Lcom/google/common/io/BaseEncoding$StandardBaseEncoding;

    # getter for: Lcom/google/common/io/BaseEncoding$StandardBaseEncoding;->alphabet:Lcom/google/common/io/BaseEncoding$Alphabet;
    invoke-static {v3}, Lcom/google/common/io/BaseEncoding$StandardBaseEncoding;->access$000(Lcom/google/common/io/BaseEncoding$StandardBaseEncoding;)Lcom/google/common/io/BaseEncoding$Alphabet;

    move-result-object v3

    iget v4, p0, Lcom/google/common/io/BaseEncoding$StandardBaseEncoding$2;->readChars:I

    add-int/lit8 v4, v4, -0x1

    invoke-virtual {v3, v4}, Lcom/google/common/io/BaseEncoding$Alphabet;->isValidPaddingStartPosition(I)Z

    move-result v3

    if-nez v3, :cond_79

    .line 707
    :cond_5e
    new-instance v2, Lcom/google/common/io/BaseEncoding$DecodingException;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Padding cannot start at index "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget v4, p0, Lcom/google/common/io/BaseEncoding$StandardBaseEncoding$2;->readChars:I

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Lcom/google/common/io/BaseEncoding$DecodingException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 709
    :cond_79
    iput-boolean v5, p0, Lcom/google/common/io/BaseEncoding$StandardBaseEncoding$2;->hitPadding:Z

    goto :goto_2

    .line 710
    :cond_7c
    iget-boolean v3, p0, Lcom/google/common/io/BaseEncoding$StandardBaseEncoding$2;->hitPadding:Z

    if-eqz v3, :cond_a5

    .line 711
    new-instance v2, Lcom/google/common/io/BaseEncoding$DecodingException;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Expected padding character but found \'"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "\' at index "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget v4, p0, Lcom/google/common/io/BaseEncoding$StandardBaseEncoding$2;->readChars:I

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Lcom/google/common/io/BaseEncoding$DecodingException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 714
    :cond_a5
    iget v3, p0, Lcom/google/common/io/BaseEncoding$StandardBaseEncoding$2;->bitBuffer:I

    iget-object v4, p0, Lcom/google/common/io/BaseEncoding$StandardBaseEncoding$2;->this$0:Lcom/google/common/io/BaseEncoding$StandardBaseEncoding;

    # getter for: Lcom/google/common/io/BaseEncoding$StandardBaseEncoding;->alphabet:Lcom/google/common/io/BaseEncoding$Alphabet;
    invoke-static {v4}, Lcom/google/common/io/BaseEncoding$StandardBaseEncoding;->access$000(Lcom/google/common/io/BaseEncoding$StandardBaseEncoding;)Lcom/google/common/io/BaseEncoding$Alphabet;

    move-result-object v4

    iget v4, v4, Lcom/google/common/io/BaseEncoding$Alphabet;->bitsPerChar:I

    shl-int/2addr v3, v4

    iput v3, p0, Lcom/google/common/io/BaseEncoding$StandardBaseEncoding$2;->bitBuffer:I

    .line 715
    iget v3, p0, Lcom/google/common/io/BaseEncoding$StandardBaseEncoding$2;->bitBuffer:I

    iget-object v4, p0, Lcom/google/common/io/BaseEncoding$StandardBaseEncoding$2;->this$0:Lcom/google/common/io/BaseEncoding$StandardBaseEncoding;

    # getter for: Lcom/google/common/io/BaseEncoding$StandardBaseEncoding;->alphabet:Lcom/google/common/io/BaseEncoding$Alphabet;
    invoke-static {v4}, Lcom/google/common/io/BaseEncoding$StandardBaseEncoding;->access$000(Lcom/google/common/io/BaseEncoding$StandardBaseEncoding;)Lcom/google/common/io/BaseEncoding$Alphabet;

    move-result-object v4

    invoke-virtual {v4, v0}, Lcom/google/common/io/BaseEncoding$Alphabet;->decode(C)I

    move-result v4

    or-int/2addr v3, v4

    iput v3, p0, Lcom/google/common/io/BaseEncoding$StandardBaseEncoding$2;->bitBuffer:I

    .line 716
    iget v3, p0, Lcom/google/common/io/BaseEncoding$StandardBaseEncoding$2;->bitBufferLength:I

    iget-object v4, p0, Lcom/google/common/io/BaseEncoding$StandardBaseEncoding$2;->this$0:Lcom/google/common/io/BaseEncoding$StandardBaseEncoding;

    # getter for: Lcom/google/common/io/BaseEncoding$StandardBaseEncoding;->alphabet:Lcom/google/common/io/BaseEncoding$Alphabet;
    invoke-static {v4}, Lcom/google/common/io/BaseEncoding$StandardBaseEncoding;->access$000(Lcom/google/common/io/BaseEncoding$StandardBaseEncoding;)Lcom/google/common/io/BaseEncoding$Alphabet;

    move-result-object v4

    iget v4, v4, Lcom/google/common/io/BaseEncoding$Alphabet;->bitsPerChar:I

    add-int/2addr v3, v4

    iput v3, p0, Lcom/google/common/io/BaseEncoding$StandardBaseEncoding$2;->bitBufferLength:I

    .line 718
    iget v3, p0, Lcom/google/common/io/BaseEncoding$StandardBaseEncoding$2;->bitBufferLength:I

    const/16 v4, 0x8

    if-lt v3, v4, :cond_2

    .line 719
    iget v2, p0, Lcom/google/common/io/BaseEncoding$StandardBaseEncoding$2;->bitBufferLength:I

    add-int/lit8 v2, v2, -0x8

    iput v2, p0, Lcom/google/common/io/BaseEncoding$StandardBaseEncoding$2;->bitBufferLength:I

    .line 720
    iget v2, p0, Lcom/google/common/io/BaseEncoding$StandardBaseEncoding$2;->bitBuffer:I

    iget v3, p0, Lcom/google/common/io/BaseEncoding$StandardBaseEncoding$2;->bitBufferLength:I

    shr-int/2addr v2, v3

    and-int/lit16 v2, v2, 0xff

    .end local v0    # "ch":C
    :cond_e1
    return v2
.end method
