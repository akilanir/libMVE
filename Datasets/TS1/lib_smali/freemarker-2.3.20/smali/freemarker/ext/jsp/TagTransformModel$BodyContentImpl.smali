.class Lfreemarker/ext/jsp/TagTransformModel$BodyContentImpl;
.super Ljavax/servlet/jsp/tagext/BodyContent;
.source "TagTransformModel.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lfreemarker/ext/jsp/TagTransformModel;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "BodyContentImpl"
.end annotation


# instance fields
.field private buf:Ljava/io/CharArrayWriter;


# direct methods
.method constructor <init>(Ljavax/servlet/jsp/JspWriter;Z)V
    .registers 3
    .param p1, "out"    # Ljavax/servlet/jsp/JspWriter;
    .param p2, "buffer"    # Z

    .prologue
    .line 145
    invoke-direct {p0, p1}, Ljavax/servlet/jsp/tagext/BodyContent;-><init>(Ljavax/servlet/jsp/JspWriter;)V

    .line 146
    if-eqz p2, :cond_8

    invoke-virtual {p0}, Lfreemarker/ext/jsp/TagTransformModel$BodyContentImpl;->initBuffer()V

    .line 147
    :cond_8
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
    .line 160
    iget-object v0, p0, Lfreemarker/ext/jsp/TagTransformModel$BodyContentImpl;->buf:Ljava/io/CharArrayWriter;

    if-eqz v0, :cond_c

    .line 161
    new-instance v0, Ljava/io/CharArrayWriter;

    invoke-direct {v0}, Ljava/io/CharArrayWriter;-><init>()V

    iput-object v0, p0, Lfreemarker/ext/jsp/TagTransformModel$BodyContentImpl;->buf:Ljava/io/CharArrayWriter;

    .line 166
    return-void

    .line 164
    :cond_c
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
    .line 169
    iget-object v0, p0, Lfreemarker/ext/jsp/TagTransformModel$BodyContentImpl;->buf:Ljava/io/CharArrayWriter;

    if-eqz v0, :cond_c

    .line 170
    new-instance v0, Ljava/io/CharArrayWriter;

    invoke-direct {v0}, Ljava/io/CharArrayWriter;-><init>()V

    iput-object v0, p0, Lfreemarker/ext/jsp/TagTransformModel$BodyContentImpl;->buf:Ljava/io/CharArrayWriter;

    .line 175
    return-void

    .line 173
    :cond_c
    new-instance v0, Ljava/io/IOException;

    const-string v1, "Can\'t clear"

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public close()V
    .registers 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 186
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
    .line 154
    iget-object v0, p0, Lfreemarker/ext/jsp/TagTransformModel$BodyContentImpl;->buf:Ljava/io/CharArrayWriter;

    if-nez v0, :cond_b

    .line 155
    invoke-virtual {p0}, Lfreemarker/ext/jsp/TagTransformModel$BodyContentImpl;->getEnclosingWriter()Ljavax/servlet/jsp/JspWriter;

    move-result-object v0

    invoke-virtual {v0}, Ljavax/servlet/jsp/JspWriter;->flush()V

    .line 157
    :cond_b
    return-void
.end method

.method public getReader()Ljava/io/Reader;
    .registers 3

    .prologue
    .line 316
    new-instance v0, Ljava/io/CharArrayReader;

    iget-object v1, p0, Lfreemarker/ext/jsp/TagTransformModel$BodyContentImpl;->buf:Ljava/io/CharArrayWriter;

    invoke-virtual {v1}, Ljava/io/CharArrayWriter;->toCharArray()[C

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/io/CharArrayReader;-><init>([C)V

    return-object v0
.end method

.method public getRemaining()I
    .registers 2

    .prologue
    .line 178
    const v0, 0x7fffffff

    return v0
.end method

.method public getString()Ljava/lang/String;
    .registers 2

    .prologue
    .line 312
    iget-object v0, p0, Lfreemarker/ext/jsp/TagTransformModel$BodyContentImpl;->buf:Ljava/io/CharArrayWriter;

    invoke-virtual {v0}, Ljava/io/CharArrayWriter;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method initBuffer()V
    .registers 2

    .prologue
    .line 150
    new-instance v0, Ljava/io/CharArrayWriter;

    invoke-direct {v0}, Ljava/io/CharArrayWriter;-><init>()V

    iput-object v0, p0, Lfreemarker/ext/jsp/TagTransformModel$BodyContentImpl;->buf:Ljava/io/CharArrayWriter;

    .line 151
    return-void
.end method

.method public newLine()V
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 182
    sget-object v0, Lfreemarker/ext/jsp/JspWriterAdapter;->NEWLINE:[C

    invoke-virtual {p0, v0}, Lfreemarker/ext/jsp/TagTransformModel$BodyContentImpl;->write([C)V

    .line 183
    return-void
.end method

.method public print(C)V
    .registers 2
    .param p1, "arg0"    # C
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 194
    invoke-virtual {p0, p1}, Lfreemarker/ext/jsp/TagTransformModel$BodyContentImpl;->write(I)V

    .line 195
    return-void
.end method

.method public print(D)V
    .registers 4
    .param p1, "arg0"    # D
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 204
    invoke-static {p1, p2}, Ljava/lang/Double;->toString(D)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lfreemarker/ext/jsp/TagTransformModel$BodyContentImpl;->write(Ljava/lang/String;)V

    .line 205
    return-void
.end method

.method public print(F)V
    .registers 3
    .param p1, "arg0"    # F
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 209
    invoke-static {p1}, Ljava/lang/Float;->toString(F)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lfreemarker/ext/jsp/TagTransformModel$BodyContentImpl;->write(Ljava/lang/String;)V

    .line 210
    return-void
.end method

.method public print(I)V
    .registers 3
    .param p1, "arg0"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 214
    invoke-static {p1}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lfreemarker/ext/jsp/TagTransformModel$BodyContentImpl;->write(Ljava/lang/String;)V

    .line 215
    return-void
.end method

.method public print(J)V
    .registers 4
    .param p1, "arg0"    # J
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 219
    invoke-static {p1, p2}, Ljava/lang/Long;->toString(J)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lfreemarker/ext/jsp/TagTransformModel$BodyContentImpl;->write(Ljava/lang/String;)V

    .line 220
    return-void
.end method

.method public print(Ljava/lang/Object;)V
    .registers 3
    .param p1, "arg0"    # Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 224
    if-nez p1, :cond_8

    const-string v0, "null"

    :goto_4
    invoke-virtual {p0, v0}, Lfreemarker/ext/jsp/TagTransformModel$BodyContentImpl;->write(Ljava/lang/String;)V

    .line 225
    return-void

    .line 224
    :cond_8
    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    goto :goto_4
.end method

.method public print(Ljava/lang/String;)V
    .registers 2
    .param p1, "arg0"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 229
    invoke-virtual {p0, p1}, Lfreemarker/ext/jsp/TagTransformModel$BodyContentImpl;->write(Ljava/lang/String;)V

    .line 230
    return-void
.end method

.method public print(Z)V
    .registers 3
    .param p1, "arg0"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 189
    if-eqz p1, :cond_c

    sget-object v0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->toString()Ljava/lang/String;

    move-result-object v0

    :goto_8
    invoke-virtual {p0, v0}, Lfreemarker/ext/jsp/TagTransformModel$BodyContentImpl;->write(Ljava/lang/String;)V

    .line 190
    return-void

    .line 189
    :cond_c
    sget-object v0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->toString()Ljava/lang/String;

    move-result-object v0

    goto :goto_8
.end method

.method public print([C)V
    .registers 2
    .param p1, "arg0"    # [C
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 199
    invoke-virtual {p0, p1}, Lfreemarker/ext/jsp/TagTransformModel$BodyContentImpl;->write([C)V

    .line 200
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
    .line 234
    invoke-virtual {p0}, Lfreemarker/ext/jsp/TagTransformModel$BodyContentImpl;->newLine()V

    .line 235
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
    .line 245
    invoke-virtual {p0, p1}, Lfreemarker/ext/jsp/TagTransformModel$BodyContentImpl;->print(C)V

    .line 246
    invoke-virtual {p0}, Lfreemarker/ext/jsp/TagTransformModel$BodyContentImpl;->newLine()V

    .line 247
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
    .line 257
    invoke-virtual {p0, p1, p2}, Lfreemarker/ext/jsp/TagTransformModel$BodyContentImpl;->print(D)V

    .line 258
    invoke-virtual {p0}, Lfreemarker/ext/jsp/TagTransformModel$BodyContentImpl;->newLine()V

    .line 259
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
    .line 263
    invoke-virtual {p0, p1}, Lfreemarker/ext/jsp/TagTransformModel$BodyContentImpl;->print(F)V

    .line 264
    invoke-virtual {p0}, Lfreemarker/ext/jsp/TagTransformModel$BodyContentImpl;->newLine()V

    .line 265
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
    .line 269
    invoke-virtual {p0, p1}, Lfreemarker/ext/jsp/TagTransformModel$BodyContentImpl;->print(I)V

    .line 270
    invoke-virtual {p0}, Lfreemarker/ext/jsp/TagTransformModel$BodyContentImpl;->newLine()V

    .line 271
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
    .line 275
    invoke-virtual {p0, p1, p2}, Lfreemarker/ext/jsp/TagTransformModel$BodyContentImpl;->print(J)V

    .line 276
    invoke-virtual {p0}, Lfreemarker/ext/jsp/TagTransformModel$BodyContentImpl;->newLine()V

    .line 277
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
    .line 281
    invoke-virtual {p0, p1}, Lfreemarker/ext/jsp/TagTransformModel$BodyContentImpl;->print(Ljava/lang/Object;)V

    .line 282
    invoke-virtual {p0}, Lfreemarker/ext/jsp/TagTransformModel$BodyContentImpl;->newLine()V

    .line 283
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
    .line 287
    invoke-virtual {p0, p1}, Lfreemarker/ext/jsp/TagTransformModel$BodyContentImpl;->print(Ljava/lang/String;)V

    .line 288
    invoke-virtual {p0}, Lfreemarker/ext/jsp/TagTransformModel$BodyContentImpl;->newLine()V

    .line 289
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
    .line 239
    invoke-virtual {p0, p1}, Lfreemarker/ext/jsp/TagTransformModel$BodyContentImpl;->print(Z)V

    .line 240
    invoke-virtual {p0}, Lfreemarker/ext/jsp/TagTransformModel$BodyContentImpl;->newLine()V

    .line 241
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
    .line 251
    invoke-virtual {p0, p1}, Lfreemarker/ext/jsp/TagTransformModel$BodyContentImpl;->print([C)V

    .line 252
    invoke-virtual {p0}, Lfreemarker/ext/jsp/TagTransformModel$BodyContentImpl;->newLine()V

    .line 253
    return-void
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
    .line 293
    iget-object v0, p0, Lfreemarker/ext/jsp/TagTransformModel$BodyContentImpl;->buf:Ljava/io/CharArrayWriter;

    if-eqz v0, :cond_a

    .line 294
    iget-object v0, p0, Lfreemarker/ext/jsp/TagTransformModel$BodyContentImpl;->buf:Ljava/io/CharArrayWriter;

    invoke-virtual {v0, p1}, Ljava/io/CharArrayWriter;->write(I)V

    .line 299
    :goto_9
    return-void

    .line 297
    :cond_a
    invoke-virtual {p0}, Lfreemarker/ext/jsp/TagTransformModel$BodyContentImpl;->getEnclosingWriter()Ljavax/servlet/jsp/JspWriter;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljavax/servlet/jsp/JspWriter;->write(I)V

    goto :goto_9
.end method

.method public write([CII)V
    .registers 5
    .param p1, "cbuf"    # [C
    .param p2, "off"    # I
    .param p3, "len"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 303
    iget-object v0, p0, Lfreemarker/ext/jsp/TagTransformModel$BodyContentImpl;->buf:Ljava/io/CharArrayWriter;

    if-eqz v0, :cond_a

    .line 304
    iget-object v0, p0, Lfreemarker/ext/jsp/TagTransformModel$BodyContentImpl;->buf:Ljava/io/CharArrayWriter;

    invoke-virtual {v0, p1, p2, p3}, Ljava/io/CharArrayWriter;->write([CII)V

    .line 309
    :goto_9
    return-void

    .line 307
    :cond_a
    invoke-virtual {p0}, Lfreemarker/ext/jsp/TagTransformModel$BodyContentImpl;->getEnclosingWriter()Ljavax/servlet/jsp/JspWriter;

    move-result-object v0

    invoke-virtual {v0, p1, p2, p3}, Ljavax/servlet/jsp/JspWriter;->write([CII)V

    goto :goto_9
.end method

.method public writeOut(Ljava/io/Writer;)V
    .registers 3
    .param p1, "out"    # Ljava/io/Writer;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 320
    iget-object v0, p0, Lfreemarker/ext/jsp/TagTransformModel$BodyContentImpl;->buf:Ljava/io/CharArrayWriter;

    invoke-virtual {v0, p1}, Ljava/io/CharArrayWriter;->writeTo(Ljava/io/Writer;)V

    .line 321
    return-void
.end method
