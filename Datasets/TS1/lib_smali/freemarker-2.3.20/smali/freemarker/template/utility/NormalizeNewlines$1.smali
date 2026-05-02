.class Lfreemarker/template/utility/NormalizeNewlines$1;
.super Ljava/io/Writer;
.source "NormalizeNewlines.java"


# instance fields
.field private final this$0:Lfreemarker/template/utility/NormalizeNewlines;

.field private final val$buf:Ljava/lang/StringBuffer;

.field private final val$out:Ljava/io/Writer;


# direct methods
.method constructor <init>(Lfreemarker/template/utility/NormalizeNewlines;Ljava/lang/StringBuffer;Ljava/io/Writer;)V
    .registers 4

    .prologue
    .line 103
    invoke-direct {p0}, Ljava/io/Writer;-><init>()V

    iput-object p1, p0, Lfreemarker/template/utility/NormalizeNewlines$1;->this$0:Lfreemarker/template/utility/NormalizeNewlines;

    iput-object p2, p0, Lfreemarker/template/utility/NormalizeNewlines$1;->val$buf:Ljava/lang/StringBuffer;

    iput-object p3, p0, Lfreemarker/template/utility/NormalizeNewlines$1;->val$out:Ljava/io/Writer;

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
    .line 113
    new-instance v0, Ljava/io/StringReader;

    iget-object v2, p0, Lfreemarker/template/utility/NormalizeNewlines$1;->val$buf:Ljava/lang/StringBuffer;

    invoke-virtual {v2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v0, v2}, Ljava/io/StringReader;-><init>(Ljava/lang/String;)V

    .line 114
    .local v0, "sr":Ljava/io/StringReader;
    new-instance v1, Ljava/io/StringWriter;

    invoke-direct {v1}, Ljava/io/StringWriter;-><init>()V

    .line 115
    .local v1, "sw":Ljava/io/StringWriter;
    iget-object v2, p0, Lfreemarker/template/utility/NormalizeNewlines$1;->this$0:Lfreemarker/template/utility/NormalizeNewlines;

    invoke-virtual {v2, v0, v1}, Lfreemarker/template/utility/NormalizeNewlines;->transform(Ljava/io/Reader;Ljava/io/Writer;)V

    .line 116
    iget-object v2, p0, Lfreemarker/template/utility/NormalizeNewlines$1;->val$out:Ljava/io/Writer;

    invoke-virtual {v1}, Ljava/io/StringWriter;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/io/Writer;->write(Ljava/lang/String;)V

    .line 117
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
    .line 109
    iget-object v0, p0, Lfreemarker/template/utility/NormalizeNewlines$1;->val$out:Ljava/io/Writer;

    invoke-virtual {v0}, Ljava/io/Writer;->flush()V

    .line 110
    return-void
.end method

.method public write([CII)V
    .registers 5
    .param p1, "cbuf"    # [C
    .param p2, "off"    # I
    .param p3, "len"    # I

    .prologue
    .line 105
    iget-object v0, p0, Lfreemarker/template/utility/NormalizeNewlines$1;->val$buf:Ljava/lang/StringBuffer;

    invoke-virtual {v0, p1, p2, p3}, Ljava/lang/StringBuffer;->append([CII)Ljava/lang/StringBuffer;

    .line 106
    return-void
.end method
