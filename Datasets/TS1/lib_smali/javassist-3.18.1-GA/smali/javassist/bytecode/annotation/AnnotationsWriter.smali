.class public Ljavassist/bytecode/annotation/AnnotationsWriter;
.super Ljava/lang/Object;
.source "AnnotationsWriter.java"


# instance fields
.field private output:Ljava/io/OutputStream;

.field private pool:Ljavassist/bytecode/ConstPool;


# direct methods
.method public constructor <init>(Ljava/io/OutputStream;Ljavassist/bytecode/ConstPool;)V
    .registers 3
    .param p1, "os"    # Ljava/io/OutputStream;
    .param p2, "cp"    # Ljavassist/bytecode/ConstPool;

    .prologue
    .line 70
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 71
    iput-object p1, p0, Ljavassist/bytecode/annotation/AnnotationsWriter;->output:Ljava/io/OutputStream;

    .line 72
    iput-object p2, p0, Ljavassist/bytecode/annotation/AnnotationsWriter;->pool:Ljavassist/bytecode/ConstPool;

    .line 73
    return-void
.end method

.method private write16bit(I)V
    .registers 4
    .param p1, "value"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 350
    const/4 v1, 0x2

    new-array v0, v1, [B

    .line 351
    .local v0, "buf":[B
    const/4 v1, 0x0

    invoke-static {p1, v0, v1}, Ljavassist/bytecode/ByteArray;->write16bit(I[BI)V

    .line 352
    iget-object v1, p0, Ljavassist/bytecode/annotation/AnnotationsWriter;->output:Ljava/io/OutputStream;

    invoke-virtual {v1, v0}, Ljava/io/OutputStream;->write([B)V

    .line 353
    return-void
.end method


# virtual methods
.method public annotation(II)V
    .registers 3
    .param p1, "typeIndex"    # I
    .param p2, "numMemberValuePairs"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 137
    invoke-direct {p0, p1}, Ljavassist/bytecode/annotation/AnnotationsWriter;->write16bit(I)V

    .line 138
    invoke-direct {p0, p2}, Ljavassist/bytecode/annotation/AnnotationsWriter;->write16bit(I)V

    .line 139
    return-void
.end method

.method public annotation(Ljava/lang/String;I)V
    .registers 4
    .param p1, "type"    # Ljava/lang/String;
    .param p2, "numMemberValuePairs"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 122
    iget-object v0, p0, Ljavassist/bytecode/annotation/AnnotationsWriter;->pool:Ljavassist/bytecode/ConstPool;

    invoke-virtual {v0, p1}, Ljavassist/bytecode/ConstPool;->addUtf8Info(Ljava/lang/String;)I

    move-result v0

    invoke-virtual {p0, v0, p2}, Ljavassist/bytecode/annotation/AnnotationsWriter;->annotation(II)V

    .line 123
    return-void
.end method

.method public annotationValue()V
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 331
    iget-object v0, p0, Ljavassist/bytecode/annotation/AnnotationsWriter;->output:Ljava/io/OutputStream;

    const/16 v1, 0x40

    invoke-virtual {v0, v1}, Ljava/io/OutputStream;->write(I)V

    .line 332
    return-void
.end method

.method public arrayValue(I)V
    .registers 4
    .param p1, "numValues"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 345
    iget-object v0, p0, Ljavassist/bytecode/annotation/AnnotationsWriter;->output:Ljava/io/OutputStream;

    const/16 v1, 0x5b

    invoke-virtual {v0, v1}, Ljava/io/OutputStream;->write(I)V

    .line 346
    invoke-direct {p0, p1}, Ljavassist/bytecode/annotation/AnnotationsWriter;->write16bit(I)V

    .line 347
    return-void
.end method

.method public classInfoIndex(I)V
    .registers 4
    .param p1, "index"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 321
    iget-object v0, p0, Ljavassist/bytecode/annotation/AnnotationsWriter;->output:Ljava/io/OutputStream;

    const/16 v1, 0x63

    invoke-virtual {v0, v1}, Ljava/io/OutputStream;->write(I)V

    .line 322
    invoke-direct {p0, p1}, Ljavassist/bytecode/annotation/AnnotationsWriter;->write16bit(I)V

    .line 323
    return-void
.end method

.method public classInfoIndex(Ljava/lang/String;)V
    .registers 3
    .param p1, "name"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 311
    iget-object v0, p0, Ljavassist/bytecode/annotation/AnnotationsWriter;->pool:Ljavassist/bytecode/ConstPool;

    invoke-virtual {v0, p1}, Ljavassist/bytecode/ConstPool;->addUtf8Info(Ljava/lang/String;)I

    move-result v0

    invoke-virtual {p0, v0}, Ljavassist/bytecode/annotation/AnnotationsWriter;->classInfoIndex(I)V

    .line 312
    return-void
.end method

.method public close()V
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 87
    iget-object v0, p0, Ljavassist/bytecode/annotation/AnnotationsWriter;->output:Ljava/io/OutputStream;

    invoke-virtual {v0}, Ljava/io/OutputStream;->close()V

    .line 88
    return-void
.end method

.method public constValueIndex(B)V
    .registers 4
    .param p1, "value"    # B
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 185
    const/16 v0, 0x42

    iget-object v1, p0, Ljavassist/bytecode/annotation/AnnotationsWriter;->pool:Ljavassist/bytecode/ConstPool;

    invoke-virtual {v1, p1}, Ljavassist/bytecode/ConstPool;->addIntegerInfo(I)I

    move-result v1

    invoke-virtual {p0, v0, v1}, Ljavassist/bytecode/annotation/AnnotationsWriter;->constValueIndex(II)V

    .line 186
    return-void
.end method

.method public constValueIndex(C)V
    .registers 4
    .param p1, "value"    # C
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 195
    const/16 v0, 0x43

    iget-object v1, p0, Ljavassist/bytecode/annotation/AnnotationsWriter;->pool:Ljavassist/bytecode/ConstPool;

    invoke-virtual {v1, p1}, Ljavassist/bytecode/ConstPool;->addIntegerInfo(I)I

    move-result v1

    invoke-virtual {p0, v0, v1}, Ljavassist/bytecode/annotation/AnnotationsWriter;->constValueIndex(II)V

    .line 196
    return-void
.end method

.method public constValueIndex(D)V
    .registers 5
    .param p1, "value"    # D
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 245
    const/16 v0, 0x44

    iget-object v1, p0, Ljavassist/bytecode/annotation/AnnotationsWriter;->pool:Ljavassist/bytecode/ConstPool;

    invoke-virtual {v1, p1, p2}, Ljavassist/bytecode/ConstPool;->addDoubleInfo(D)I

    move-result v1

    invoke-virtual {p0, v0, v1}, Ljavassist/bytecode/annotation/AnnotationsWriter;->constValueIndex(II)V

    .line 246
    return-void
.end method

.method public constValueIndex(F)V
    .registers 4
    .param p1, "value"    # F
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 235
    const/16 v0, 0x46

    iget-object v1, p0, Ljavassist/bytecode/annotation/AnnotationsWriter;->pool:Ljavassist/bytecode/ConstPool;

    invoke-virtual {v1, p1}, Ljavassist/bytecode/ConstPool;->addFloatInfo(F)I

    move-result v1

    invoke-virtual {p0, v0, v1}, Ljavassist/bytecode/annotation/AnnotationsWriter;->constValueIndex(II)V

    .line 236
    return-void
.end method

.method public constValueIndex(I)V
    .registers 4
    .param p1, "value"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 215
    const/16 v0, 0x49

    iget-object v1, p0, Ljavassist/bytecode/annotation/AnnotationsWriter;->pool:Ljavassist/bytecode/ConstPool;

    invoke-virtual {v1, p1}, Ljavassist/bytecode/ConstPool;->addIntegerInfo(I)I

    move-result v1

    invoke-virtual {p0, v0, v1}, Ljavassist/bytecode/annotation/AnnotationsWriter;->constValueIndex(II)V

    .line 216
    return-void
.end method

.method public constValueIndex(II)V
    .registers 4
    .param p1, "tag"    # I
    .param p2, "index"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 269
    iget-object v0, p0, Ljavassist/bytecode/annotation/AnnotationsWriter;->output:Ljava/io/OutputStream;

    invoke-virtual {v0, p1}, Ljava/io/OutputStream;->write(I)V

    .line 270
    invoke-direct {p0, p2}, Ljavassist/bytecode/annotation/AnnotationsWriter;->write16bit(I)V

    .line 271
    return-void
.end method

.method public constValueIndex(J)V
    .registers 5
    .param p1, "value"    # J
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 225
    const/16 v0, 0x4a

    iget-object v1, p0, Ljavassist/bytecode/annotation/AnnotationsWriter;->pool:Ljavassist/bytecode/ConstPool;

    invoke-virtual {v1, p1, p2}, Ljavassist/bytecode/ConstPool;->addLongInfo(J)I

    move-result v1

    invoke-virtual {p0, v0, v1}, Ljavassist/bytecode/annotation/AnnotationsWriter;->constValueIndex(II)V

    .line 226
    return-void
.end method

.method public constValueIndex(Ljava/lang/String;)V
    .registers 4
    .param p1, "value"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 255
    const/16 v0, 0x73

    iget-object v1, p0, Ljavassist/bytecode/annotation/AnnotationsWriter;->pool:Ljavassist/bytecode/ConstPool;

    invoke-virtual {v1, p1}, Ljavassist/bytecode/ConstPool;->addUtf8Info(Ljava/lang/String;)I

    move-result v1

    invoke-virtual {p0, v0, v1}, Ljavassist/bytecode/annotation/AnnotationsWriter;->constValueIndex(II)V

    .line 256
    return-void
.end method

.method public constValueIndex(S)V
    .registers 4
    .param p1, "value"    # S
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 205
    const/16 v0, 0x53

    iget-object v1, p0, Ljavassist/bytecode/annotation/AnnotationsWriter;->pool:Ljavassist/bytecode/ConstPool;

    invoke-virtual {v1, p1}, Ljavassist/bytecode/ConstPool;->addIntegerInfo(I)I

    move-result v1

    invoke-virtual {p0, v0, v1}, Ljavassist/bytecode/annotation/AnnotationsWriter;->constValueIndex(II)V

    .line 206
    return-void
.end method

.method public constValueIndex(Z)V
    .registers 5
    .param p1, "value"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 175
    const/16 v1, 0x5a

    iget-object v2, p0, Ljavassist/bytecode/annotation/AnnotationsWriter;->pool:Ljavassist/bytecode/ConstPool;

    if-eqz p1, :cond_f

    const/4 v0, 0x1

    :goto_7
    invoke-virtual {v2, v0}, Ljavassist/bytecode/ConstPool;->addIntegerInfo(I)I

    move-result v0

    invoke-virtual {p0, v1, v0}, Ljavassist/bytecode/annotation/AnnotationsWriter;->constValueIndex(II)V

    .line 176
    return-void

    .line 175
    :cond_f
    const/4 v0, 0x0

    goto :goto_7
.end method

.method public enumConstValue(II)V
    .registers 5
    .param p1, "typeNameIndex"    # I
    .param p2, "constNameIndex"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 299
    iget-object v0, p0, Ljavassist/bytecode/annotation/AnnotationsWriter;->output:Ljava/io/OutputStream;

    const/16 v1, 0x65

    invoke-virtual {v0, v1}, Ljava/io/OutputStream;->write(I)V

    .line 300
    invoke-direct {p0, p1}, Ljavassist/bytecode/annotation/AnnotationsWriter;->write16bit(I)V

    .line 301
    invoke-direct {p0, p2}, Ljavassist/bytecode/annotation/AnnotationsWriter;->write16bit(I)V

    .line 302
    return-void
.end method

.method public enumConstValue(Ljava/lang/String;Ljava/lang/String;)V
    .registers 5
    .param p1, "typeName"    # Ljava/lang/String;
    .param p2, "constName"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 283
    iget-object v0, p0, Ljavassist/bytecode/annotation/AnnotationsWriter;->pool:Ljavassist/bytecode/ConstPool;

    invoke-virtual {v0, p1}, Ljavassist/bytecode/ConstPool;->addUtf8Info(Ljava/lang/String;)I

    move-result v0

    iget-object v1, p0, Ljavassist/bytecode/annotation/AnnotationsWriter;->pool:Ljavassist/bytecode/ConstPool;

    invoke-virtual {v1, p2}, Ljavassist/bytecode/ConstPool;->addUtf8Info(Ljava/lang/String;)I

    move-result v1

    invoke-virtual {p0, v0, v1}, Ljavassist/bytecode/annotation/AnnotationsWriter;->enumConstValue(II)V

    .line 285
    return-void
.end method

.method public getConstPool()Ljavassist/bytecode/ConstPool;
    .registers 2

    .prologue
    .line 79
    iget-object v0, p0, Ljavassist/bytecode/annotation/AnnotationsWriter;->pool:Ljavassist/bytecode/ConstPool;

    return-object v0
.end method

.method public memberValuePair(I)V
    .registers 2
    .param p1, "memberNameIndex"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 165
    invoke-direct {p0, p1}, Ljavassist/bytecode/annotation/AnnotationsWriter;->write16bit(I)V

    .line 166
    return-void
.end method

.method public memberValuePair(Ljava/lang/String;)V
    .registers 3
    .param p1, "memberName"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 151
    iget-object v0, p0, Ljavassist/bytecode/annotation/AnnotationsWriter;->pool:Ljavassist/bytecode/ConstPool;

    invoke-virtual {v0, p1}, Ljavassist/bytecode/ConstPool;->addUtf8Info(Ljava/lang/String;)I

    move-result v0

    invoke-virtual {p0, v0}, Ljavassist/bytecode/annotation/AnnotationsWriter;->memberValuePair(I)V

    .line 152
    return-void
.end method

.method public numAnnotations(I)V
    .registers 2
    .param p1, "num"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 107
    invoke-direct {p0, p1}, Ljavassist/bytecode/annotation/AnnotationsWriter;->write16bit(I)V

    .line 108
    return-void
.end method

.method public numParameters(I)V
    .registers 3
    .param p1, "num"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 97
    iget-object v0, p0, Ljavassist/bytecode/annotation/AnnotationsWriter;->output:Ljava/io/OutputStream;

    invoke-virtual {v0, p1}, Ljava/io/OutputStream;->write(I)V

    .line 98
    return-void
.end method
