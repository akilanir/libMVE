.class Lfreemarker/ext/jsp/JspWriterAdapter;
.super Ljavax/servlet/jsp/JspWriter;
.source "JspWriterAdapter.java"


# static fields
.field static final NEWLINE:[C


# instance fields
.field private final out:Ljava/io/Writer;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 11
    const-string v0, "line.separator"

    invoke-static {v0}, Lfreemarker/template/utility/SecurityUtilities;->getSystemProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->toCharArray()[C

    move-result-object v0

    sput-object v0, Lfreemarker/ext/jsp/JspWriterAdapter;->NEWLINE:[C

    return-void
.end method

.method constructor <init>(Ljava/io/Writer;)V
    .registers 4
    .param p1, "out"    # Ljava/io/Writer;

    .prologue
    .line 16
    const/4 v0, 0x0

    const/4 v1, 0x1

    invoke-direct {p0, v0, v1}, Ljavax/servlet/jsp/JspWriter;-><init>(IZ)V

    .line 17
    iput-object p1, p0, Lfreemarker/ext/jsp/JspWriterAdapter;->out:Ljava/io/Writer;

    .line 18
    return-void
.end method


# virtual methods
.method public clear()V
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 25
    new-instance v0, Ljava/io/IOException;

    const-string v1, "Can\'t clear"

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public clearBuffer()V
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 29
    new-instance v0, Ljava/io/IOException;

    const-string v1, "Can\'t clear"

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public close()V
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 33
    new-instance v0, Ljava/io/IOException;

    const-string v1, "Close not permitted."

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public flush()V
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 37
    iget-object v0, p0, Lfreemarker/ext/jsp/JspWriterAdapter;->out:Ljava/io/Writer;

    invoke-virtual {v0}, Ljava/io/Writer;->flush()V

    .line 38
    return-void
.end method

.method public getRemaining()I
    .registers 2

    .prologue
    .line 41
    const/4 v0, 0x0

    return v0
.end method

.method public newLine()V
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 45
    iget-object v0, p0, Lfreemarker/ext/jsp/JspWriterAdapter;->out:Ljava/io/Writer;

    sget-object v1, Lfreemarker/ext/jsp/JspWriterAdapter;->NEWLINE:[C

    invoke-virtual {v0, v1}, Ljava/io/Writer;->write([C)V

    .line 46
    return-void
.end method

.method public print(C)V
    .registers 3
    .param p1, "arg0"    # C
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 54
    iget-object v0, p0, Lfreemarker/ext/jsp/JspWriterAdapter;->out:Ljava/io/Writer;

    invoke-virtual {v0, p1}, Ljava/io/Writer;->write(I)V

    .line 55
    return-void
.end method

.method public print(D)V
    .registers 5
    .param p1, "arg0"    # D
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 64
    iget-object v0, p0, Lfreemarker/ext/jsp/JspWriterAdapter;->out:Ljava/io/Writer;

    invoke-static {p1, p2}, Ljava/lang/Double;->toString(D)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/io/Writer;->write(Ljava/lang/String;)V

    .line 65
    return-void
.end method

.method public print(F)V
    .registers 4
    .param p1, "arg0"    # F
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 69
    iget-object v0, p0, Lfreemarker/ext/jsp/JspWriterAdapter;->out:Ljava/io/Writer;

    invoke-static {p1}, Ljava/lang/Float;->toString(F)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/io/Writer;->write(Ljava/lang/String;)V

    .line 70
    return-void
.end method

.method public print(I)V
    .registers 4
    .param p1, "arg0"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 74
    iget-object v0, p0, Lfreemarker/ext/jsp/JspWriterAdapter;->out:Ljava/io/Writer;

    invoke-static {p1}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/io/Writer;->write(Ljava/lang/String;)V

    .line 75
    return-void
.end method

.method public print(J)V
    .registers 5
    .param p1, "arg0"    # J
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 79
    iget-object v0, p0, Lfreemarker/ext/jsp/JspWriterAdapter;->out:Ljava/io/Writer;

    invoke-static {p1, p2}, Ljava/lang/Long;->toString(J)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/io/Writer;->write(Ljava/lang/String;)V

    .line 80
    return-void
.end method

.method public print(Ljava/lang/Object;)V
    .registers 4
    .param p1, "arg0"    # Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 84
    iget-object v1, p0, Lfreemarker/ext/jsp/JspWriterAdapter;->out:Ljava/io/Writer;

    if-nez p1, :cond_a

    const-string v0, "null"

    :goto_6
    invoke-virtual {v1, v0}, Ljava/io/Writer;->write(Ljava/lang/String;)V

    .line 85
    return-void

    .line 84
    :cond_a
    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    goto :goto_6
.end method

.method public print(Ljava/lang/String;)V
    .registers 3
    .param p1, "arg0"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 89
    iget-object v0, p0, Lfreemarker/ext/jsp/JspWriterAdapter;->out:Ljava/io/Writer;

    invoke-virtual {v0, p1}, Ljava/io/Writer;->write(Ljava/lang/String;)V

    .line 90
    return-void
.end method

.method public print(Z)V
    .registers 4
    .param p1, "arg0"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 49
    iget-object v1, p0, Lfreemarker/ext/jsp/JspWriterAdapter;->out:Ljava/io/Writer;

    if-eqz p1, :cond_e

    sget-object v0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->toString()Ljava/lang/String;

    move-result-object v0

    :goto_a
    invoke-virtual {v1, v0}, Ljava/io/Writer;->write(Ljava/lang/String;)V

    .line 50
    return-void

    .line 49
    :cond_e
    sget-object v0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->toString()Ljava/lang/String;

    move-result-object v0

    goto :goto_a
.end method

.method public print([C)V
    .registers 3
    .param p1, "arg0"    # [C
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 59
    iget-object v0, p0, Lfreemarker/ext/jsp/JspWriterAdapter;->out:Ljava/io/Writer;

    invoke-virtual {v0, p1}, Ljava/io/Writer;->write([C)V

    .line 60
    return-void
.end method

.method public println()V
    .registers 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 94
    invoke-virtual {p0}, Lfreemarker/ext/jsp/JspWriterAdapter;->newLine()V

    .line 95
    return-void
.end method

.method public println(C)V
    .registers 2
    .param p1, "arg0"    # C
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 105
    invoke-virtual {p0, p1}, Lfreemarker/ext/jsp/JspWriterAdapter;->print(C)V

    .line 106
    invoke-virtual {p0}, Lfreemarker/ext/jsp/JspWriterAdapter;->newLine()V

    .line 107
    return-void
.end method

.method public println(D)V
    .registers 3
    .param p1, "arg0"    # D
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 117
    invoke-virtual {p0, p1, p2}, Lfreemarker/ext/jsp/JspWriterAdapter;->print(D)V

    .line 118
    invoke-virtual {p0}, Lfreemarker/ext/jsp/JspWriterAdapter;->newLine()V

    .line 119
    return-void
.end method

.method public println(F)V
    .registers 2
    .param p1, "arg0"    # F
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 123
    invoke-virtual {p0, p1}, Lfreemarker/ext/jsp/JspWriterAdapter;->print(F)V

    .line 124
    invoke-virtual {p0}, Lfreemarker/ext/jsp/JspWriterAdapter;->newLine()V

    .line 125
    return-void
.end method

.method public println(I)V
    .registers 2
    .param p1, "arg0"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 129
    invoke-virtual {p0, p1}, Lfreemarker/ext/jsp/JspWriterAdapter;->print(I)V

    .line 130
    invoke-virtual {p0}, Lfreemarker/ext/jsp/JspWriterAdapter;->newLine()V

    .line 131
    return-void
.end method

.method public println(J)V
    .registers 3
    .param p1, "arg0"    # J
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 135
    invoke-virtual {p0, p1, p2}, Lfreemarker/ext/jsp/JspWriterAdapter;->print(J)V

    .line 136
    invoke-virtual {p0}, Lfreemarker/ext/jsp/JspWriterAdapter;->newLine()V

    .line 137
    return-void
.end method

.method public println(Ljava/lang/Object;)V
    .registers 2
    .param p1, "arg0"    # Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 141
    invoke-virtual {p0, p1}, Lfreemarker/ext/jsp/JspWriterAdapter;->print(Ljava/lang/Object;)V

    .line 142
    invoke-virtual {p0}, Lfreemarker/ext/jsp/JspWriterAdapter;->newLine()V

    .line 143
    return-void
.end method

.method public println(Ljava/lang/String;)V
    .registers 2
    .param p1, "arg0"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 147
    invoke-virtual {p0, p1}, Lfreemarker/ext/jsp/JspWriterAdapter;->print(Ljava/lang/String;)V

    .line 148
    invoke-virtual {p0}, Lfreemarker/ext/jsp/JspWriterAdapter;->newLine()V

    .line 149
    return-void
.end method

.method public println(Z)V
    .registers 2
    .param p1, "arg0"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 99
    invoke-virtual {p0, p1}, Lfreemarker/ext/jsp/JspWriterAdapter;->print(Z)V

    .line 100
    invoke-virtual {p0}, Lfreemarker/ext/jsp/JspWriterAdapter;->newLine()V

    .line 101
    return-void
.end method

.method public println([C)V
    .registers 2
    .param p1, "arg0"    # [C
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 111
    invoke-virtual {p0, p1}, Lfreemarker/ext/jsp/JspWriterAdapter;->print([C)V

    .line 112
    invoke-virtual {p0}, Lfreemarker/ext/jsp/JspWriterAdapter;->newLine()V

    .line 113
    return-void
.end method

.method public toString()Ljava/lang/String;
    .registers 3

    .prologue
    .line 21
    new-instance v0, Ljava/lang/StringBuffer;

    invoke-direct {v0}, Ljava/lang/StringBuffer;-><init>()V

    const-string v1, "JspWriterAdapter wrapping a "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v0

    iget-object v1, p0, Lfreemarker/ext/jsp/JspWriterAdapter;->out:Ljava/io/Writer;

    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public write(I)V
    .registers 3
    .param p1, "c"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 153
    iget-object v0, p0, Lfreemarker/ext/jsp/JspWriterAdapter;->out:Ljava/io/Writer;

    invoke-virtual {v0, p1}, Ljava/io/Writer;->write(I)V

    .line 154
    return-void
.end method

.method public write([CII)V
    .registers 5
    .param p1, "arg0"    # [C
    .param p2, "arg1"    # I
    .param p3, "arg2"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 159
    iget-object v0, p0, Lfreemarker/ext/jsp/JspWriterAdapter;->out:Ljava/io/Writer;

    invoke-virtual {v0, p1, p2, p3}, Ljava/io/Writer;->write([CII)V

    .line 160
    return-void
.end method
