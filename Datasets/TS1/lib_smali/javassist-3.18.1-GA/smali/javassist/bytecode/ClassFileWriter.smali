.class public Ljavassist/bytecode/ClassFileWriter;
.super Ljava/lang/Object;
.source "ClassFileWriter.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ljavassist/bytecode/ClassFileWriter$ConstPoolWriter;,
        Ljavassist/bytecode/ClassFileWriter$MethodWriter;,
        Ljavassist/bytecode/ClassFileWriter$FieldWriter;,
        Ljavassist/bytecode/ClassFileWriter$AttributeWriter;
    }
.end annotation


# instance fields
.field private constPool:Ljavassist/bytecode/ClassFileWriter$ConstPoolWriter;

.field private fields:Ljavassist/bytecode/ClassFileWriter$FieldWriter;

.field private methods:Ljavassist/bytecode/ClassFileWriter$MethodWriter;

.field private output:Ljavassist/bytecode/ByteStream;

.field superClass:I

.field thisClass:I


# direct methods
.method public constructor <init>(II)V
    .registers 5
    .param p1, "major"    # I
    .param p2, "minor"    # I

    .prologue
    .line 89
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 90
    new-instance v0, Ljavassist/bytecode/ByteStream;

    const/16 v1, 0x200

    invoke-direct {v0, v1}, Ljavassist/bytecode/ByteStream;-><init>(I)V

    iput-object v0, p0, Ljavassist/bytecode/ClassFileWriter;->output:Ljavassist/bytecode/ByteStream;

    .line 91
    iget-object v0, p0, Ljavassist/bytecode/ClassFileWriter;->output:Ljavassist/bytecode/ByteStream;

    const v1, -0x35014542    # -8346975.0f

    invoke-virtual {v0, v1}, Ljavassist/bytecode/ByteStream;->writeInt(I)V

    .line 92
    iget-object v0, p0, Ljavassist/bytecode/ClassFileWriter;->output:Ljavassist/bytecode/ByteStream;

    invoke-virtual {v0, p2}, Ljavassist/bytecode/ByteStream;->writeShort(I)V

    .line 93
    iget-object v0, p0, Ljavassist/bytecode/ClassFileWriter;->output:Ljavassist/bytecode/ByteStream;

    invoke-virtual {v0, p1}, Ljavassist/bytecode/ByteStream;->writeShort(I)V

    .line 94
    new-instance v0, Ljavassist/bytecode/ClassFileWriter$ConstPoolWriter;

    iget-object v1, p0, Ljavassist/bytecode/ClassFileWriter;->output:Ljavassist/bytecode/ByteStream;

    invoke-direct {v0, v1}, Ljavassist/bytecode/ClassFileWriter$ConstPoolWriter;-><init>(Ljavassist/bytecode/ByteStream;)V

    iput-object v0, p0, Ljavassist/bytecode/ClassFileWriter;->constPool:Ljavassist/bytecode/ClassFileWriter$ConstPoolWriter;

    .line 95
    new-instance v0, Ljavassist/bytecode/ClassFileWriter$FieldWriter;

    iget-object v1, p0, Ljavassist/bytecode/ClassFileWriter;->constPool:Ljavassist/bytecode/ClassFileWriter$ConstPoolWriter;

    invoke-direct {v0, v1}, Ljavassist/bytecode/ClassFileWriter$FieldWriter;-><init>(Ljavassist/bytecode/ClassFileWriter$ConstPoolWriter;)V

    iput-object v0, p0, Ljavassist/bytecode/ClassFileWriter;->fields:Ljavassist/bytecode/ClassFileWriter$FieldWriter;

    .line 96
    new-instance v0, Ljavassist/bytecode/ClassFileWriter$MethodWriter;

    iget-object v1, p0, Ljavassist/bytecode/ClassFileWriter;->constPool:Ljavassist/bytecode/ClassFileWriter$ConstPoolWriter;

    invoke-direct {v0, v1}, Ljavassist/bytecode/ClassFileWriter$MethodWriter;-><init>(Ljavassist/bytecode/ClassFileWriter$ConstPoolWriter;)V

    iput-object v0, p0, Ljavassist/bytecode/ClassFileWriter;->methods:Ljavassist/bytecode/ClassFileWriter$MethodWriter;

    .line 98
    return-void
.end method

.method static writeAttribute(Ljavassist/bytecode/ByteStream;Ljavassist/bytecode/ClassFileWriter$AttributeWriter;I)V
    .registers 5
    .param p0, "bs"    # Ljavassist/bytecode/ByteStream;
    .param p1, "aw"    # Ljavassist/bytecode/ClassFileWriter$AttributeWriter;
    .param p2, "attrCount"    # I

    .prologue
    .line 237
    if-nez p1, :cond_6

    .line 238
    invoke-virtual {p0, p2}, Ljavassist/bytecode/ByteStream;->writeShort(I)V

    .line 249
    :goto_5
    return-void

    .line 242
    :cond_6
    invoke-interface {p1}, Ljavassist/bytecode/ClassFileWriter$AttributeWriter;->size()I

    move-result v1

    add-int/2addr v1, p2

    invoke-virtual {p0, v1}, Ljavassist/bytecode/ByteStream;->writeShort(I)V

    .line 243
    new-instance v0, Ljava/io/DataOutputStream;

    invoke-direct {v0, p0}, Ljava/io/DataOutputStream;-><init>(Ljava/io/OutputStream;)V

    .line 245
    .local v0, "dos":Ljava/io/DataOutputStream;
    :try_start_13
    invoke-interface {p1, v0}, Ljavassist/bytecode/ClassFileWriter$AttributeWriter;->write(Ljava/io/DataOutputStream;)V

    .line 246
    invoke-virtual {v0}, Ljava/io/DataOutputStream;->flush()V
    :try_end_19
    .catch Ljava/io/IOException; {:try_start_13 .. :try_end_19} :catch_1a

    goto :goto_5

    .line 248
    :catch_1a
    move-exception v1

    goto :goto_5
.end method


# virtual methods
.method public end(Ljava/io/DataOutputStream;III[ILjavassist/bytecode/ClassFileWriter$AttributeWriter;)V
    .registers 11
    .param p1, "out"    # Ljava/io/DataOutputStream;
    .param p2, "accessFlags"    # I
    .param p3, "thisClass"    # I
    .param p4, "superClass"    # I
    .param p5, "interfaces"    # [I
    .param p6, "aw"    # Ljavassist/bytecode/ClassFileWriter$AttributeWriter;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v3, 0x0

    .line 176
    iget-object v2, p0, Ljavassist/bytecode/ClassFileWriter;->constPool:Ljavassist/bytecode/ClassFileWriter$ConstPoolWriter;

    invoke-virtual {v2}, Ljavassist/bytecode/ClassFileWriter$ConstPoolWriter;->end()V

    .line 177
    iget-object v2, p0, Ljavassist/bytecode/ClassFileWriter;->output:Ljavassist/bytecode/ByteStream;

    invoke-virtual {v2, p1}, Ljavassist/bytecode/ByteStream;->writeTo(Ljava/io/OutputStream;)V

    .line 178
    invoke-virtual {p1, p2}, Ljava/io/DataOutputStream;->writeShort(I)V

    .line 179
    invoke-virtual {p1, p3}, Ljava/io/DataOutputStream;->writeShort(I)V

    .line 180
    invoke-virtual {p1, p4}, Ljava/io/DataOutputStream;->writeShort(I)V

    .line 181
    if-nez p5, :cond_3b

    .line 182
    invoke-virtual {p1, v3}, Ljava/io/DataOutputStream;->writeShort(I)V

    .line 190
    :cond_19
    iget-object v2, p0, Ljavassist/bytecode/ClassFileWriter;->fields:Ljavassist/bytecode/ClassFileWriter$FieldWriter;

    invoke-virtual {v2}, Ljavassist/bytecode/ClassFileWriter$FieldWriter;->size()I

    move-result v2

    invoke-virtual {p1, v2}, Ljava/io/DataOutputStream;->writeShort(I)V

    .line 191
    iget-object v2, p0, Ljavassist/bytecode/ClassFileWriter;->fields:Ljavassist/bytecode/ClassFileWriter$FieldWriter;

    invoke-virtual {v2, p1}, Ljavassist/bytecode/ClassFileWriter$FieldWriter;->write(Ljava/io/OutputStream;)V

    .line 193
    iget-object v2, p0, Ljavassist/bytecode/ClassFileWriter;->methods:Ljavassist/bytecode/ClassFileWriter$MethodWriter;

    invoke-virtual {v2}, Ljavassist/bytecode/ClassFileWriter$MethodWriter;->size()I

    move-result v2

    invoke-virtual {p1, v2}, Ljava/io/DataOutputStream;->writeShort(I)V

    .line 194
    iget-object v2, p0, Ljavassist/bytecode/ClassFileWriter;->methods:Ljavassist/bytecode/ClassFileWriter$MethodWriter;

    invoke-virtual {v2, p1}, Ljavassist/bytecode/ClassFileWriter$MethodWriter;->write(Ljava/io/OutputStream;)V

    .line 195
    if-nez p6, :cond_4a

    .line 196
    invoke-virtual {p1, v3}, Ljava/io/DataOutputStream;->writeShort(I)V

    .line 201
    :goto_3a
    return-void

    .line 184
    :cond_3b
    array-length v1, p5

    .line 185
    .local v1, "n":I
    invoke-virtual {p1, v1}, Ljava/io/DataOutputStream;->writeShort(I)V

    .line 186
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_40
    if-ge v0, v1, :cond_19

    .line 187
    aget v2, p5, v0

    invoke-virtual {p1, v2}, Ljava/io/DataOutputStream;->writeShort(I)V

    .line 186
    add-int/lit8 v0, v0, 0x1

    goto :goto_40

    .line 198
    .end local v0    # "i":I
    .end local v1    # "n":I
    :cond_4a
    invoke-interface {p6}, Ljavassist/bytecode/ClassFileWriter$AttributeWriter;->size()I

    move-result v2

    invoke-virtual {p1, v2}, Ljava/io/DataOutputStream;->writeShort(I)V

    .line 199
    invoke-interface {p6, p1}, Ljavassist/bytecode/ClassFileWriter$AttributeWriter;->write(Ljava/io/DataOutputStream;)V

    goto :goto_3a
.end method

.method public end(III[ILjavassist/bytecode/ClassFileWriter$AttributeWriter;)[B
    .registers 12
    .param p1, "accessFlags"    # I
    .param p2, "thisClass"    # I
    .param p3, "superClass"    # I
    .param p4, "interfaces"    # [I
    .param p5, "aw"    # Ljavassist/bytecode/ClassFileWriter$AttributeWriter;

    .prologue
    const/4 v5, 0x0

    .line 130
    iget-object v2, p0, Ljavassist/bytecode/ClassFileWriter;->constPool:Ljavassist/bytecode/ClassFileWriter$ConstPoolWriter;

    invoke-virtual {v2}, Ljavassist/bytecode/ClassFileWriter$ConstPoolWriter;->end()V

    .line 131
    iget-object v2, p0, Ljavassist/bytecode/ClassFileWriter;->output:Ljavassist/bytecode/ByteStream;

    invoke-virtual {v2, p1}, Ljavassist/bytecode/ByteStream;->writeShort(I)V

    .line 132
    iget-object v2, p0, Ljavassist/bytecode/ClassFileWriter;->output:Ljavassist/bytecode/ByteStream;

    invoke-virtual {v2, p2}, Ljavassist/bytecode/ByteStream;->writeShort(I)V

    .line 133
    iget-object v2, p0, Ljavassist/bytecode/ClassFileWriter;->output:Ljavassist/bytecode/ByteStream;

    invoke-virtual {v2, p3}, Ljavassist/bytecode/ByteStream;->writeShort(I)V

    .line 134
    if-nez p4, :cond_60

    .line 135
    iget-object v2, p0, Ljavassist/bytecode/ClassFileWriter;->output:Ljavassist/bytecode/ByteStream;

    invoke-virtual {v2, v5}, Ljavassist/bytecode/ByteStream;->writeShort(I)V

    .line 143
    :cond_1c
    iget-object v2, p0, Ljavassist/bytecode/ClassFileWriter;->output:Ljavassist/bytecode/ByteStream;

    iget-object v3, p0, Ljavassist/bytecode/ClassFileWriter;->fields:Ljavassist/bytecode/ClassFileWriter$FieldWriter;

    invoke-virtual {v3}, Ljavassist/bytecode/ClassFileWriter$FieldWriter;->dataSize()I

    move-result v3

    iget-object v4, p0, Ljavassist/bytecode/ClassFileWriter;->methods:Ljavassist/bytecode/ClassFileWriter$MethodWriter;

    invoke-virtual {v4}, Ljavassist/bytecode/ClassFileWriter$MethodWriter;->dataSize()I

    move-result v4

    add-int/2addr v3, v4

    add-int/lit8 v3, v3, 0x6

    invoke-virtual {v2, v3}, Ljavassist/bytecode/ByteStream;->enlarge(I)V

    .line 145
    :try_start_30
    iget-object v2, p0, Ljavassist/bytecode/ClassFileWriter;->output:Ljavassist/bytecode/ByteStream;

    iget-object v3, p0, Ljavassist/bytecode/ClassFileWriter;->fields:Ljavassist/bytecode/ClassFileWriter$FieldWriter;

    invoke-virtual {v3}, Ljavassist/bytecode/ClassFileWriter$FieldWriter;->size()I

    move-result v3

    invoke-virtual {v2, v3}, Ljavassist/bytecode/ByteStream;->writeShort(I)V

    .line 146
    iget-object v2, p0, Ljavassist/bytecode/ClassFileWriter;->fields:Ljavassist/bytecode/ClassFileWriter$FieldWriter;

    iget-object v3, p0, Ljavassist/bytecode/ClassFileWriter;->output:Ljavassist/bytecode/ByteStream;

    invoke-virtual {v2, v3}, Ljavassist/bytecode/ClassFileWriter$FieldWriter;->write(Ljava/io/OutputStream;)V

    .line 148
    iget-object v2, p0, Ljavassist/bytecode/ClassFileWriter;->output:Ljavassist/bytecode/ByteStream;

    iget-object v3, p0, Ljavassist/bytecode/ClassFileWriter;->methods:Ljavassist/bytecode/ClassFileWriter$MethodWriter;

    invoke-virtual {v3}, Ljavassist/bytecode/ClassFileWriter$MethodWriter;->size()I

    move-result v3

    invoke-virtual {v2, v3}, Ljavassist/bytecode/ByteStream;->writeShort(I)V

    .line 149
    iget-object v2, p0, Ljavassist/bytecode/ClassFileWriter;->methods:Ljavassist/bytecode/ClassFileWriter$MethodWriter;

    iget-object v3, p0, Ljavassist/bytecode/ClassFileWriter;->output:Ljavassist/bytecode/ByteStream;

    invoke-virtual {v2, v3}, Ljavassist/bytecode/ClassFileWriter$MethodWriter;->write(Ljava/io/OutputStream;)V
    :try_end_54
    .catch Ljava/io/IOException; {:try_start_30 .. :try_end_54} :catch_73

    .line 153
    :goto_54
    iget-object v2, p0, Ljavassist/bytecode/ClassFileWriter;->output:Ljavassist/bytecode/ByteStream;

    invoke-static {v2, p5, v5}, Ljavassist/bytecode/ClassFileWriter;->writeAttribute(Ljavassist/bytecode/ByteStream;Ljavassist/bytecode/ClassFileWriter$AttributeWriter;I)V

    .line 154
    iget-object v2, p0, Ljavassist/bytecode/ClassFileWriter;->output:Ljavassist/bytecode/ByteStream;

    invoke-virtual {v2}, Ljavassist/bytecode/ByteStream;->toByteArray()[B

    move-result-object v2

    return-object v2

    .line 137
    :cond_60
    array-length v1, p4

    .line 138
    .local v1, "n":I
    iget-object v2, p0, Ljavassist/bytecode/ClassFileWriter;->output:Ljavassist/bytecode/ByteStream;

    invoke-virtual {v2, v1}, Ljavassist/bytecode/ByteStream;->writeShort(I)V

    .line 139
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_67
    if-ge v0, v1, :cond_1c

    .line 140
    iget-object v2, p0, Ljavassist/bytecode/ClassFileWriter;->output:Ljavassist/bytecode/ByteStream;

    aget v3, p4, v0

    invoke-virtual {v2, v3}, Ljavassist/bytecode/ByteStream;->writeShort(I)V

    .line 139
    add-int/lit8 v0, v0, 0x1

    goto :goto_67

    .line 151
    .end local v0    # "i":I
    .end local v1    # "n":I
    :catch_73
    move-exception v2

    goto :goto_54
.end method

.method public getConstPool()Ljavassist/bytecode/ClassFileWriter$ConstPoolWriter;
    .registers 2

    .prologue
    .line 103
    iget-object v0, p0, Ljavassist/bytecode/ClassFileWriter;->constPool:Ljavassist/bytecode/ClassFileWriter$ConstPoolWriter;

    return-object v0
.end method

.method public getFieldWriter()Ljavassist/bytecode/ClassFileWriter$FieldWriter;
    .registers 2

    .prologue
    .line 108
    iget-object v0, p0, Ljavassist/bytecode/ClassFileWriter;->fields:Ljavassist/bytecode/ClassFileWriter$FieldWriter;

    return-object v0
.end method

.method public getMethodWriter()Ljavassist/bytecode/ClassFileWriter$MethodWriter;
    .registers 2

    .prologue
    .line 113
    iget-object v0, p0, Ljavassist/bytecode/ClassFileWriter;->methods:Ljavassist/bytecode/ClassFileWriter$MethodWriter;

    return-object v0
.end method
