.class Lcom/google/common/io/BaseEncoding$StandardBaseEncoding$1;
.super Ljava/lang/Object;
.source "BaseEncoding.java"

# interfaces
.implements Lcom/google/common/io/GwtWorkarounds$ByteOutput;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/google/common/io/BaseEncoding$StandardBaseEncoding;->encodingStream(Lcom/google/common/io/GwtWorkarounds$CharOutput;)Lcom/google/common/io/GwtWorkarounds$ByteOutput;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field bitBuffer:I

.field bitBufferLength:I

.field final synthetic this$0:Lcom/google/common/io/BaseEncoding$StandardBaseEncoding;

.field final synthetic val$out:Lcom/google/common/io/GwtWorkarounds$CharOutput;

.field writtenChars:I


# direct methods
.method constructor <init>(Lcom/google/common/io/BaseEncoding$StandardBaseEncoding;Lcom/google/common/io/GwtWorkarounds$CharOutput;)V
    .registers 4

    .prologue
    const/4 v0, 0x0

    .line 594
    iput-object p1, p0, Lcom/google/common/io/BaseEncoding$StandardBaseEncoding$1;->this$0:Lcom/google/common/io/BaseEncoding$StandardBaseEncoding;

    iput-object p2, p0, Lcom/google/common/io/BaseEncoding$StandardBaseEncoding$1;->val$out:Lcom/google/common/io/GwtWorkarounds$CharOutput;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 595
    iput v0, p0, Lcom/google/common/io/BaseEncoding$StandardBaseEncoding$1;->bitBuffer:I

    .line 596
    iput v0, p0, Lcom/google/common/io/BaseEncoding$StandardBaseEncoding$1;->bitBufferLength:I

    .line 597
    iput v0, p0, Lcom/google/common/io/BaseEncoding$StandardBaseEncoding$1;->writtenChars:I

    return-void
.end method


# virtual methods
.method public close()V
    .registers 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 620
    iget v1, p0, Lcom/google/common/io/BaseEncoding$StandardBaseEncoding$1;->bitBufferLength:I

    if-lez v1, :cond_5c

    .line 621
    iget v1, p0, Lcom/google/common/io/BaseEncoding$StandardBaseEncoding$1;->bitBuffer:I

    iget-object v2, p0, Lcom/google/common/io/BaseEncoding$StandardBaseEncoding$1;->this$0:Lcom/google/common/io/BaseEncoding$StandardBaseEncoding;

    # getter for: Lcom/google/common/io/BaseEncoding$StandardBaseEncoding;->alphabet:Lcom/google/common/io/BaseEncoding$Alphabet;
    invoke-static {v2}, Lcom/google/common/io/BaseEncoding$StandardBaseEncoding;->access$000(Lcom/google/common/io/BaseEncoding$StandardBaseEncoding;)Lcom/google/common/io/BaseEncoding$Alphabet;

    move-result-object v2

    iget v2, v2, Lcom/google/common/io/BaseEncoding$Alphabet;->bitsPerChar:I

    iget v3, p0, Lcom/google/common/io/BaseEncoding$StandardBaseEncoding$1;->bitBufferLength:I

    sub-int/2addr v2, v3

    shl-int/2addr v1, v2

    iget-object v2, p0, Lcom/google/common/io/BaseEncoding$StandardBaseEncoding$1;->this$0:Lcom/google/common/io/BaseEncoding$StandardBaseEncoding;

    # getter for: Lcom/google/common/io/BaseEncoding$StandardBaseEncoding;->alphabet:Lcom/google/common/io/BaseEncoding$Alphabet;
    invoke-static {v2}, Lcom/google/common/io/BaseEncoding$StandardBaseEncoding;->access$000(Lcom/google/common/io/BaseEncoding$StandardBaseEncoding;)Lcom/google/common/io/BaseEncoding$Alphabet;

    move-result-object v2

    iget v2, v2, Lcom/google/common/io/BaseEncoding$Alphabet;->mask:I

    and-int v0, v1, v2

    .line 623
    .local v0, "charIndex":I
    iget-object v1, p0, Lcom/google/common/io/BaseEncoding$StandardBaseEncoding$1;->val$out:Lcom/google/common/io/GwtWorkarounds$CharOutput;

    iget-object v2, p0, Lcom/google/common/io/BaseEncoding$StandardBaseEncoding$1;->this$0:Lcom/google/common/io/BaseEncoding$StandardBaseEncoding;

    # getter for: Lcom/google/common/io/BaseEncoding$StandardBaseEncoding;->alphabet:Lcom/google/common/io/BaseEncoding$Alphabet;
    invoke-static {v2}, Lcom/google/common/io/BaseEncoding$StandardBaseEncoding;->access$000(Lcom/google/common/io/BaseEncoding$StandardBaseEncoding;)Lcom/google/common/io/BaseEncoding$Alphabet;

    move-result-object v2

    invoke-virtual {v2, v0}, Lcom/google/common/io/BaseEncoding$Alphabet;->encode(I)C

    move-result v2

    invoke-interface {v1, v2}, Lcom/google/common/io/GwtWorkarounds$CharOutput;->write(C)V

    .line 624
    iget v1, p0, Lcom/google/common/io/BaseEncoding$StandardBaseEncoding$1;->writtenChars:I

    add-int/lit8 v1, v1, 0x1

    iput v1, p0, Lcom/google/common/io/BaseEncoding$StandardBaseEncoding$1;->writtenChars:I

    .line 625
    iget-object v1, p0, Lcom/google/common/io/BaseEncoding$StandardBaseEncoding$1;->this$0:Lcom/google/common/io/BaseEncoding$StandardBaseEncoding;

    # getter for: Lcom/google/common/io/BaseEncoding$StandardBaseEncoding;->paddingChar:Ljava/lang/Character;
    invoke-static {v1}, Lcom/google/common/io/BaseEncoding$StandardBaseEncoding;->access$100(Lcom/google/common/io/BaseEncoding$StandardBaseEncoding;)Ljava/lang/Character;

    move-result-object v1

    if-eqz v1, :cond_5c

    .line 626
    :goto_39
    iget v1, p0, Lcom/google/common/io/BaseEncoding$StandardBaseEncoding$1;->writtenChars:I

    iget-object v2, p0, Lcom/google/common/io/BaseEncoding$StandardBaseEncoding$1;->this$0:Lcom/google/common/io/BaseEncoding$StandardBaseEncoding;

    # getter for: Lcom/google/common/io/BaseEncoding$StandardBaseEncoding;->alphabet:Lcom/google/common/io/BaseEncoding$Alphabet;
    invoke-static {v2}, Lcom/google/common/io/BaseEncoding$StandardBaseEncoding;->access$000(Lcom/google/common/io/BaseEncoding$StandardBaseEncoding;)Lcom/google/common/io/BaseEncoding$Alphabet;

    move-result-object v2

    iget v2, v2, Lcom/google/common/io/BaseEncoding$Alphabet;->charsPerChunk:I

    rem-int/2addr v1, v2

    if-eqz v1, :cond_5c

    .line 627
    iget-object v1, p0, Lcom/google/common/io/BaseEncoding$StandardBaseEncoding$1;->val$out:Lcom/google/common/io/GwtWorkarounds$CharOutput;

    iget-object v2, p0, Lcom/google/common/io/BaseEncoding$StandardBaseEncoding$1;->this$0:Lcom/google/common/io/BaseEncoding$StandardBaseEncoding;

    # getter for: Lcom/google/common/io/BaseEncoding$StandardBaseEncoding;->paddingChar:Ljava/lang/Character;
    invoke-static {v2}, Lcom/google/common/io/BaseEncoding$StandardBaseEncoding;->access$100(Lcom/google/common/io/BaseEncoding$StandardBaseEncoding;)Ljava/lang/Character;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Character;->charValue()C

    move-result v2

    invoke-interface {v1, v2}, Lcom/google/common/io/GwtWorkarounds$CharOutput;->write(C)V

    .line 628
    iget v1, p0, Lcom/google/common/io/BaseEncoding$StandardBaseEncoding$1;->writtenChars:I

    add-int/lit8 v1, v1, 0x1

    iput v1, p0, Lcom/google/common/io/BaseEncoding$StandardBaseEncoding$1;->writtenChars:I

    goto :goto_39

    .line 632
    .end local v0    # "charIndex":I
    :cond_5c
    iget-object v1, p0, Lcom/google/common/io/BaseEncoding$StandardBaseEncoding$1;->val$out:Lcom/google/common/io/GwtWorkarounds$CharOutput;

    invoke-interface {v1}, Lcom/google/common/io/GwtWorkarounds$CharOutput;->close()V

    .line 633
    return-void
.end method

.method public flush()V
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 615
    iget-object v0, p0, Lcom/google/common/io/BaseEncoding$StandardBaseEncoding$1;->val$out:Lcom/google/common/io/GwtWorkarounds$CharOutput;

    invoke-interface {v0}, Lcom/google/common/io/GwtWorkarounds$CharOutput;->flush()V

    .line 616
    return-void
.end method

.method public write(B)V
    .registers 6
    .param p1, "b"    # B
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 601
    iget v1, p0, Lcom/google/common/io/BaseEncoding$StandardBaseEncoding$1;->bitBuffer:I

    shl-int/lit8 v1, v1, 0x8

    iput v1, p0, Lcom/google/common/io/BaseEncoding$StandardBaseEncoding$1;->bitBuffer:I

    .line 602
    iget v1, p0, Lcom/google/common/io/BaseEncoding$StandardBaseEncoding$1;->bitBuffer:I

    and-int/lit16 v2, p1, 0xff

    or-int/2addr v1, v2

    iput v1, p0, Lcom/google/common/io/BaseEncoding$StandardBaseEncoding$1;->bitBuffer:I

    .line 603
    iget v1, p0, Lcom/google/common/io/BaseEncoding$StandardBaseEncoding$1;->bitBufferLength:I

    add-int/lit8 v1, v1, 0x8

    iput v1, p0, Lcom/google/common/io/BaseEncoding$StandardBaseEncoding$1;->bitBufferLength:I

    .line 604
    :goto_13
    iget v1, p0, Lcom/google/common/io/BaseEncoding$StandardBaseEncoding$1;->bitBufferLength:I

    iget-object v2, p0, Lcom/google/common/io/BaseEncoding$StandardBaseEncoding$1;->this$0:Lcom/google/common/io/BaseEncoding$StandardBaseEncoding;

    # getter for: Lcom/google/common/io/BaseEncoding$StandardBaseEncoding;->alphabet:Lcom/google/common/io/BaseEncoding$Alphabet;
    invoke-static {v2}, Lcom/google/common/io/BaseEncoding$StandardBaseEncoding;->access$000(Lcom/google/common/io/BaseEncoding$StandardBaseEncoding;)Lcom/google/common/io/BaseEncoding$Alphabet;

    move-result-object v2

    iget v2, v2, Lcom/google/common/io/BaseEncoding$Alphabet;->bitsPerChar:I

    if-lt v1, v2, :cond_5a

    .line 605
    iget v1, p0, Lcom/google/common/io/BaseEncoding$StandardBaseEncoding$1;->bitBuffer:I

    iget v2, p0, Lcom/google/common/io/BaseEncoding$StandardBaseEncoding$1;->bitBufferLength:I

    iget-object v3, p0, Lcom/google/common/io/BaseEncoding$StandardBaseEncoding$1;->this$0:Lcom/google/common/io/BaseEncoding$StandardBaseEncoding;

    # getter for: Lcom/google/common/io/BaseEncoding$StandardBaseEncoding;->alphabet:Lcom/google/common/io/BaseEncoding$Alphabet;
    invoke-static {v3}, Lcom/google/common/io/BaseEncoding$StandardBaseEncoding;->access$000(Lcom/google/common/io/BaseEncoding$StandardBaseEncoding;)Lcom/google/common/io/BaseEncoding$Alphabet;

    move-result-object v3

    iget v3, v3, Lcom/google/common/io/BaseEncoding$Alphabet;->bitsPerChar:I

    sub-int/2addr v2, v3

    shr-int/2addr v1, v2

    iget-object v2, p0, Lcom/google/common/io/BaseEncoding$StandardBaseEncoding$1;->this$0:Lcom/google/common/io/BaseEncoding$StandardBaseEncoding;

    # getter for: Lcom/google/common/io/BaseEncoding$StandardBaseEncoding;->alphabet:Lcom/google/common/io/BaseEncoding$Alphabet;
    invoke-static {v2}, Lcom/google/common/io/BaseEncoding$StandardBaseEncoding;->access$000(Lcom/google/common/io/BaseEncoding$StandardBaseEncoding;)Lcom/google/common/io/BaseEncoding$Alphabet;

    move-result-object v2

    iget v2, v2, Lcom/google/common/io/BaseEncoding$Alphabet;->mask:I

    and-int v0, v1, v2

    .line 607
    .local v0, "charIndex":I
    iget-object v1, p0, Lcom/google/common/io/BaseEncoding$StandardBaseEncoding$1;->val$out:Lcom/google/common/io/GwtWorkarounds$CharOutput;

    iget-object v2, p0, Lcom/google/common/io/BaseEncoding$StandardBaseEncoding$1;->this$0:Lcom/google/common/io/BaseEncoding$StandardBaseEncoding;

    # getter for: Lcom/google/common/io/BaseEncoding$StandardBaseEncoding;->alphabet:Lcom/google/common/io/BaseEncoding$Alphabet;
    invoke-static {v2}, Lcom/google/common/io/BaseEncoding$StandardBaseEncoding;->access$000(Lcom/google/common/io/BaseEncoding$StandardBaseEncoding;)Lcom/google/common/io/BaseEncoding$Alphabet;

    move-result-object v2

    invoke-virtual {v2, v0}, Lcom/google/common/io/BaseEncoding$Alphabet;->encode(I)C

    move-result v2

    invoke-interface {v1, v2}, Lcom/google/common/io/GwtWorkarounds$CharOutput;->write(C)V

    .line 608
    iget v1, p0, Lcom/google/common/io/BaseEncoding$StandardBaseEncoding$1;->writtenChars:I

    add-int/lit8 v1, v1, 0x1

    iput v1, p0, Lcom/google/common/io/BaseEncoding$StandardBaseEncoding$1;->writtenChars:I

    .line 609
    iget v1, p0, Lcom/google/common/io/BaseEncoding$StandardBaseEncoding$1;->bitBufferLength:I

    iget-object v2, p0, Lcom/google/common/io/BaseEncoding$StandardBaseEncoding$1;->this$0:Lcom/google/common/io/BaseEncoding$StandardBaseEncoding;

    # getter for: Lcom/google/common/io/BaseEncoding$StandardBaseEncoding;->alphabet:Lcom/google/common/io/BaseEncoding$Alphabet;
    invoke-static {v2}, Lcom/google/common/io/BaseEncoding$StandardBaseEncoding;->access$000(Lcom/google/common/io/BaseEncoding$StandardBaseEncoding;)Lcom/google/common/io/BaseEncoding$Alphabet;

    move-result-object v2

    iget v2, v2, Lcom/google/common/io/BaseEncoding$Alphabet;->bitsPerChar:I

    sub-int/2addr v1, v2

    iput v1, p0, Lcom/google/common/io/BaseEncoding$StandardBaseEncoding$1;->bitBufferLength:I

    goto :goto_13

    .line 611
    .end local v0    # "charIndex":I
    :cond_5a
    return-void
.end method
