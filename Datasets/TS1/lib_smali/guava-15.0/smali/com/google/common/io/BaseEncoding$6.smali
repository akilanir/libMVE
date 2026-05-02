.class final Lcom/google/common/io/BaseEncoding$6;
.super Ljava/lang/Object;
.source "BaseEncoding.java"

# interfaces
.implements Lcom/google/common/io/GwtWorkarounds$CharOutput;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/google/common/io/BaseEncoding;->separatingOutput(Lcom/google/common/io/GwtWorkarounds$CharOutput;Ljava/lang/String;I)Lcom/google/common/io/GwtWorkarounds$CharOutput;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation


# instance fields
.field charsUntilSeparator:I

.field final synthetic val$afterEveryChars:I

.field final synthetic val$delegate:Lcom/google/common/io/GwtWorkarounds$CharOutput;

.field final synthetic val$separator:Ljava/lang/String;


# direct methods
.method constructor <init>(ILjava/lang/String;Lcom/google/common/io/GwtWorkarounds$CharOutput;)V
    .registers 5

    .prologue
    .line 821
    iput p1, p0, Lcom/google/common/io/BaseEncoding$6;->val$afterEveryChars:I

    iput-object p2, p0, Lcom/google/common/io/BaseEncoding$6;->val$separator:Ljava/lang/String;

    iput-object p3, p0, Lcom/google/common/io/BaseEncoding$6;->val$delegate:Lcom/google/common/io/GwtWorkarounds$CharOutput;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 822
    iget v0, p0, Lcom/google/common/io/BaseEncoding$6;->val$afterEveryChars:I

    iput v0, p0, Lcom/google/common/io/BaseEncoding$6;->charsUntilSeparator:I

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
    .line 843
    iget-object v0, p0, Lcom/google/common/io/BaseEncoding$6;->val$delegate:Lcom/google/common/io/GwtWorkarounds$CharOutput;

    invoke-interface {v0}, Lcom/google/common/io/GwtWorkarounds$CharOutput;->close()V

    .line 844
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
    .line 838
    iget-object v0, p0, Lcom/google/common/io/BaseEncoding$6;->val$delegate:Lcom/google/common/io/GwtWorkarounds$CharOutput;

    invoke-interface {v0}, Lcom/google/common/io/GwtWorkarounds$CharOutput;->flush()V

    .line 839
    return-void
.end method

.method public write(C)V
    .registers 5
    .param p1, "c"    # C
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 826
    iget v1, p0, Lcom/google/common/io/BaseEncoding$6;->charsUntilSeparator:I

    if-nez v1, :cond_1f

    .line 827
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_5
    iget-object v1, p0, Lcom/google/common/io/BaseEncoding$6;->val$separator:Ljava/lang/String;

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v1

    if-ge v0, v1, :cond_1b

    .line 828
    iget-object v1, p0, Lcom/google/common/io/BaseEncoding$6;->val$delegate:Lcom/google/common/io/GwtWorkarounds$CharOutput;

    iget-object v2, p0, Lcom/google/common/io/BaseEncoding$6;->val$separator:Ljava/lang/String;

    invoke-virtual {v2, v0}, Ljava/lang/String;->charAt(I)C

    move-result v2

    invoke-interface {v1, v2}, Lcom/google/common/io/GwtWorkarounds$CharOutput;->write(C)V

    .line 827
    add-int/lit8 v0, v0, 0x1

    goto :goto_5

    .line 830
    :cond_1b
    iget v1, p0, Lcom/google/common/io/BaseEncoding$6;->val$afterEveryChars:I

    iput v1, p0, Lcom/google/common/io/BaseEncoding$6;->charsUntilSeparator:I

    .line 832
    .end local v0    # "i":I
    :cond_1f
    iget-object v1, p0, Lcom/google/common/io/BaseEncoding$6;->val$delegate:Lcom/google/common/io/GwtWorkarounds$CharOutput;

    invoke-interface {v1, p1}, Lcom/google/common/io/GwtWorkarounds$CharOutput;->write(C)V

    .line 833
    iget v1, p0, Lcom/google/common/io/BaseEncoding$6;->charsUntilSeparator:I

    add-int/lit8 v1, v1, -0x1

    iput v1, p0, Lcom/google/common/io/BaseEncoding$6;->charsUntilSeparator:I

    .line 834
    return-void
.end method
