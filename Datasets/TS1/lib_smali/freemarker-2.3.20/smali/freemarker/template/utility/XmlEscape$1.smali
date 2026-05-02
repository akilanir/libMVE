.class Lfreemarker/template/utility/XmlEscape$1;
.super Ljava/io/Writer;
.source "XmlEscape.java"


# instance fields
.field private final this$0:Lfreemarker/template/utility/XmlEscape;

.field private final val$out:Ljava/io/Writer;


# direct methods
.method constructor <init>(Lfreemarker/template/utility/XmlEscape;Ljava/io/Writer;)V
    .registers 3

    .prologue
    .line 79
    invoke-direct {p0}, Ljava/io/Writer;-><init>()V

    iput-object p1, p0, Lfreemarker/template/utility/XmlEscape$1;->this$0:Lfreemarker/template/utility/XmlEscape;

    iput-object p2, p0, Lfreemarker/template/utility/XmlEscape$1;->val$out:Ljava/io/Writer;

    return-void
.end method


# virtual methods
.method public close()V
    .registers 1

    .prologue
    .line 123
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
    .line 119
    iget-object v0, p0, Lfreemarker/template/utility/XmlEscape$1;->val$out:Ljava/io/Writer;

    invoke-virtual {v0}, Ljava/io/Writer;->flush()V

    .line 120
    return-void
.end method

.method public write(I)V
    .registers 7
    .param p1, "c"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v4, 0x6

    const/4 v2, 0x4

    const/4 v3, 0x0

    .line 84
    sparse-switch p1, :sswitch_data_40

    .line 91
    iget-object v0, p0, Lfreemarker/template/utility/XmlEscape$1;->val$out:Ljava/io/Writer;

    invoke-virtual {v0, p1}, Ljava/io/Writer;->write(I)V

    .line 93
    :goto_b
    return-void

    .line 86
    :sswitch_c
    iget-object v0, p0, Lfreemarker/template/utility/XmlEscape$1;->val$out:Ljava/io/Writer;

    invoke-static {}, Lfreemarker/template/utility/XmlEscape;->access$000()[C

    move-result-object v1

    invoke-virtual {v0, v1, v3, v2}, Ljava/io/Writer;->write([CII)V

    goto :goto_b

    .line 87
    :sswitch_16
    iget-object v0, p0, Lfreemarker/template/utility/XmlEscape$1;->val$out:Ljava/io/Writer;

    invoke-static {}, Lfreemarker/template/utility/XmlEscape;->access$100()[C

    move-result-object v1

    invoke-virtual {v0, v1, v3, v2}, Ljava/io/Writer;->write([CII)V

    goto :goto_b

    .line 88
    :sswitch_20
    iget-object v0, p0, Lfreemarker/template/utility/XmlEscape$1;->val$out:Ljava/io/Writer;

    invoke-static {}, Lfreemarker/template/utility/XmlEscape;->access$200()[C

    move-result-object v1

    const/4 v2, 0x5

    invoke-virtual {v0, v1, v3, v2}, Ljava/io/Writer;->write([CII)V

    goto :goto_b

    .line 89
    :sswitch_2b
    iget-object v0, p0, Lfreemarker/template/utility/XmlEscape$1;->val$out:Ljava/io/Writer;

    invoke-static {}, Lfreemarker/template/utility/XmlEscape;->access$300()[C

    move-result-object v1

    invoke-virtual {v0, v1, v3, v4}, Ljava/io/Writer;->write([CII)V

    goto :goto_b

    .line 90
    :sswitch_35
    iget-object v0, p0, Lfreemarker/template/utility/XmlEscape$1;->val$out:Ljava/io/Writer;

    invoke-static {}, Lfreemarker/template/utility/XmlEscape;->access$400()[C

    move-result-object v1

    invoke-virtual {v0, v1, v3, v4}, Ljava/io/Writer;->write([CII)V

    goto :goto_b

    .line 84
    nop

    :sswitch_data_40
    .sparse-switch
        0x22 -> :sswitch_2b
        0x26 -> :sswitch_20
        0x27 -> :sswitch_35
        0x3c -> :sswitch_c
        0x3e -> :sswitch_16
    .end sparse-switch
.end method

.method public write([CII)V
    .registers 14
    .param p1, "cbuf"    # [C
    .param p2, "off"    # I
    .param p3, "len"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v9, 0x6

    const/4 v8, 0x4

    const/4 v7, 0x0

    .line 99
    move v1, p2

    .line 100
    .local v1, "lastoff":I
    add-int v2, p2, p3

    .line 101
    .local v2, "lastpos":I
    move v0, p2

    .local v0, "i":I
    :goto_7
    if-ge v0, v2, :cond_71

    .line 103
    aget-char v4, p1, v0

    sparse-switch v4, :sswitch_data_7c

    .line 101
    :goto_e
    add-int/lit8 v0, v0, 0x1

    goto :goto_7

    .line 105
    :sswitch_11
    iget-object v4, p0, Lfreemarker/template/utility/XmlEscape$1;->val$out:Ljava/io/Writer;

    sub-int v5, v0, v1

    invoke-virtual {v4, p1, v1, v5}, Ljava/io/Writer;->write([CII)V

    iget-object v4, p0, Lfreemarker/template/utility/XmlEscape$1;->val$out:Ljava/io/Writer;

    invoke-static {}, Lfreemarker/template/utility/XmlEscape;->access$000()[C

    move-result-object v5

    invoke-virtual {v4, v5, v7, v8}, Ljava/io/Writer;->write([CII)V

    add-int/lit8 v1, v0, 0x1

    goto :goto_e

    .line 106
    :sswitch_24
    iget-object v4, p0, Lfreemarker/template/utility/XmlEscape$1;->val$out:Ljava/io/Writer;

    sub-int v5, v0, v1

    invoke-virtual {v4, p1, v1, v5}, Ljava/io/Writer;->write([CII)V

    iget-object v4, p0, Lfreemarker/template/utility/XmlEscape$1;->val$out:Ljava/io/Writer;

    invoke-static {}, Lfreemarker/template/utility/XmlEscape;->access$100()[C

    move-result-object v5

    invoke-virtual {v4, v5, v7, v8}, Ljava/io/Writer;->write([CII)V

    add-int/lit8 v1, v0, 0x1

    goto :goto_e

    .line 107
    :sswitch_37
    iget-object v4, p0, Lfreemarker/template/utility/XmlEscape$1;->val$out:Ljava/io/Writer;

    sub-int v5, v0, v1

    invoke-virtual {v4, p1, v1, v5}, Ljava/io/Writer;->write([CII)V

    iget-object v4, p0, Lfreemarker/template/utility/XmlEscape$1;->val$out:Ljava/io/Writer;

    invoke-static {}, Lfreemarker/template/utility/XmlEscape;->access$200()[C

    move-result-object v5

    const/4 v6, 0x5

    invoke-virtual {v4, v5, v7, v6}, Ljava/io/Writer;->write([CII)V

    add-int/lit8 v1, v0, 0x1

    goto :goto_e

    .line 108
    :sswitch_4b
    iget-object v4, p0, Lfreemarker/template/utility/XmlEscape$1;->val$out:Ljava/io/Writer;

    sub-int v5, v0, v1

    invoke-virtual {v4, p1, v1, v5}, Ljava/io/Writer;->write([CII)V

    iget-object v4, p0, Lfreemarker/template/utility/XmlEscape$1;->val$out:Ljava/io/Writer;

    invoke-static {}, Lfreemarker/template/utility/XmlEscape;->access$300()[C

    move-result-object v5

    invoke-virtual {v4, v5, v7, v9}, Ljava/io/Writer;->write([CII)V

    add-int/lit8 v1, v0, 0x1

    goto :goto_e

    .line 109
    :sswitch_5e
    iget-object v4, p0, Lfreemarker/template/utility/XmlEscape$1;->val$out:Ljava/io/Writer;

    sub-int v5, v0, v1

    invoke-virtual {v4, p1, v1, v5}, Ljava/io/Writer;->write([CII)V

    iget-object v4, p0, Lfreemarker/template/utility/XmlEscape$1;->val$out:Ljava/io/Writer;

    invoke-static {}, Lfreemarker/template/utility/XmlEscape;->access$400()[C

    move-result-object v5

    invoke-virtual {v4, v5, v7, v9}, Ljava/io/Writer;->write([CII)V

    add-int/lit8 v1, v0, 0x1

    goto :goto_e

    .line 112
    :cond_71
    sub-int v3, v2, v1

    .line 113
    .local v3, "remaining":I
    if-lez v3, :cond_7a

    .line 115
    iget-object v4, p0, Lfreemarker/template/utility/XmlEscape$1;->val$out:Ljava/io/Writer;

    invoke-virtual {v4, p1, v1, v3}, Ljava/io/Writer;->write([CII)V

    .line 117
    :cond_7a
    return-void

    .line 103
    nop

    :sswitch_data_7c
    .sparse-switch
        0x22 -> :sswitch_4b
        0x26 -> :sswitch_37
        0x27 -> :sswitch_5e
        0x3c -> :sswitch_11
        0x3e -> :sswitch_24
    .end sparse-switch
.end method
