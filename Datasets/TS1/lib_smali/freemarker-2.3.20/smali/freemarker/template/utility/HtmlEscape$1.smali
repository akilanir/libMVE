.class Lfreemarker/template/utility/HtmlEscape$1;
.super Ljava/io/Writer;
.source "HtmlEscape.java"


# instance fields
.field private final this$0:Lfreemarker/template/utility/HtmlEscape;

.field private final val$out:Ljava/io/Writer;


# direct methods
.method constructor <init>(Lfreemarker/template/utility/HtmlEscape;Ljava/io/Writer;)V
    .registers 3

    .prologue
    .line 98
    invoke-direct {p0}, Ljava/io/Writer;-><init>()V

    iput-object p1, p0, Lfreemarker/template/utility/HtmlEscape$1;->this$0:Lfreemarker/template/utility/HtmlEscape;

    iput-object p2, p0, Lfreemarker/template/utility/HtmlEscape$1;->val$out:Ljava/io/Writer;

    return-void
.end method


# virtual methods
.method public close()V
    .registers 1

    .prologue
    .line 140
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
    .line 136
    iget-object v0, p0, Lfreemarker/template/utility/HtmlEscape$1;->val$out:Ljava/io/Writer;

    invoke-virtual {v0}, Ljava/io/Writer;->flush()V

    .line 137
    return-void
.end method

.method public write(I)V
    .registers 6
    .param p1, "c"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v2, 0x4

    const/4 v3, 0x0

    .line 103
    sparse-switch p1, :sswitch_data_36

    .line 109
    iget-object v0, p0, Lfreemarker/template/utility/HtmlEscape$1;->val$out:Ljava/io/Writer;

    invoke-virtual {v0, p1}, Ljava/io/Writer;->write(I)V

    .line 111
    :goto_a
    return-void

    .line 105
    :sswitch_b
    iget-object v0, p0, Lfreemarker/template/utility/HtmlEscape$1;->val$out:Ljava/io/Writer;

    invoke-static {}, Lfreemarker/template/utility/HtmlEscape;->access$000()[C

    move-result-object v1

    invoke-virtual {v0, v1, v3, v2}, Ljava/io/Writer;->write([CII)V

    goto :goto_a

    .line 106
    :sswitch_15
    iget-object v0, p0, Lfreemarker/template/utility/HtmlEscape$1;->val$out:Ljava/io/Writer;

    invoke-static {}, Lfreemarker/template/utility/HtmlEscape;->access$100()[C

    move-result-object v1

    invoke-virtual {v0, v1, v3, v2}, Ljava/io/Writer;->write([CII)V

    goto :goto_a

    .line 107
    :sswitch_1f
    iget-object v0, p0, Lfreemarker/template/utility/HtmlEscape$1;->val$out:Ljava/io/Writer;

    invoke-static {}, Lfreemarker/template/utility/HtmlEscape;->access$200()[C

    move-result-object v1

    const/4 v2, 0x5

    invoke-virtual {v0, v1, v3, v2}, Ljava/io/Writer;->write([CII)V

    goto :goto_a

    .line 108
    :sswitch_2a
    iget-object v0, p0, Lfreemarker/template/utility/HtmlEscape$1;->val$out:Ljava/io/Writer;

    invoke-static {}, Lfreemarker/template/utility/HtmlEscape;->access$300()[C

    move-result-object v1

    const/4 v2, 0x6

    invoke-virtual {v0, v1, v3, v2}, Ljava/io/Writer;->write([CII)V

    goto :goto_a

    .line 103
    nop

    :sswitch_data_36
    .sparse-switch
        0x22 -> :sswitch_2a
        0x26 -> :sswitch_1f
        0x3c -> :sswitch_b
        0x3e -> :sswitch_15
    .end sparse-switch
.end method

.method public write([CII)V
    .registers 13
    .param p1, "cbuf"    # [C
    .param p2, "off"    # I
    .param p3, "len"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v8, 0x4

    const/4 v7, 0x0

    .line 117
    move v1, p2

    .line 118
    .local v1, "lastoff":I
    add-int v2, p2, p3

    .line 119
    .local v2, "lastpos":I
    move v0, p2

    .local v0, "i":I
    :goto_6
    if-ge v0, v2, :cond_5e

    .line 121
    aget-char v4, p1, v0

    sparse-switch v4, :sswitch_data_68

    .line 119
    :goto_d
    add-int/lit8 v0, v0, 0x1

    goto :goto_6

    .line 123
    :sswitch_10
    iget-object v4, p0, Lfreemarker/template/utility/HtmlEscape$1;->val$out:Ljava/io/Writer;

    sub-int v5, v0, v1

    invoke-virtual {v4, p1, v1, v5}, Ljava/io/Writer;->write([CII)V

    iget-object v4, p0, Lfreemarker/template/utility/HtmlEscape$1;->val$out:Ljava/io/Writer;

    invoke-static {}, Lfreemarker/template/utility/HtmlEscape;->access$000()[C

    move-result-object v5

    invoke-virtual {v4, v5, v7, v8}, Ljava/io/Writer;->write([CII)V

    add-int/lit8 v1, v0, 0x1

    goto :goto_d

    .line 124
    :sswitch_23
    iget-object v4, p0, Lfreemarker/template/utility/HtmlEscape$1;->val$out:Ljava/io/Writer;

    sub-int v5, v0, v1

    invoke-virtual {v4, p1, v1, v5}, Ljava/io/Writer;->write([CII)V

    iget-object v4, p0, Lfreemarker/template/utility/HtmlEscape$1;->val$out:Ljava/io/Writer;

    invoke-static {}, Lfreemarker/template/utility/HtmlEscape;->access$100()[C

    move-result-object v5

    invoke-virtual {v4, v5, v7, v8}, Ljava/io/Writer;->write([CII)V

    add-int/lit8 v1, v0, 0x1

    goto :goto_d

    .line 125
    :sswitch_36
    iget-object v4, p0, Lfreemarker/template/utility/HtmlEscape$1;->val$out:Ljava/io/Writer;

    sub-int v5, v0, v1

    invoke-virtual {v4, p1, v1, v5}, Ljava/io/Writer;->write([CII)V

    iget-object v4, p0, Lfreemarker/template/utility/HtmlEscape$1;->val$out:Ljava/io/Writer;

    invoke-static {}, Lfreemarker/template/utility/HtmlEscape;->access$200()[C

    move-result-object v5

    const/4 v6, 0x5

    invoke-virtual {v4, v5, v7, v6}, Ljava/io/Writer;->write([CII)V

    add-int/lit8 v1, v0, 0x1

    goto :goto_d

    .line 126
    :sswitch_4a
    iget-object v4, p0, Lfreemarker/template/utility/HtmlEscape$1;->val$out:Ljava/io/Writer;

    sub-int v5, v0, v1

    invoke-virtual {v4, p1, v1, v5}, Ljava/io/Writer;->write([CII)V

    iget-object v4, p0, Lfreemarker/template/utility/HtmlEscape$1;->val$out:Ljava/io/Writer;

    invoke-static {}, Lfreemarker/template/utility/HtmlEscape;->access$300()[C

    move-result-object v5

    const/4 v6, 0x6

    invoke-virtual {v4, v5, v7, v6}, Ljava/io/Writer;->write([CII)V

    add-int/lit8 v1, v0, 0x1

    goto :goto_d

    .line 129
    :cond_5e
    sub-int v3, v2, v1

    .line 130
    .local v3, "remaining":I
    if-lez v3, :cond_67

    .line 132
    iget-object v4, p0, Lfreemarker/template/utility/HtmlEscape$1;->val$out:Ljava/io/Writer;

    invoke-virtual {v4, p1, v1, v3}, Ljava/io/Writer;->write([CII)V

    .line 134
    :cond_67
    return-void

    .line 121
    :sswitch_data_68
    .sparse-switch
        0x22 -> :sswitch_4a
        0x26 -> :sswitch_36
        0x3c -> :sswitch_10
        0x3e -> :sswitch_23
    .end sparse-switch
.end method
