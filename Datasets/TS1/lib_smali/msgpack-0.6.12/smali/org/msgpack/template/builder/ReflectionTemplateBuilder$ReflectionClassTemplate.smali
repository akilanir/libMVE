.class public Lorg/msgpack/template/builder/ReflectionTemplateBuilder$ReflectionClassTemplate;
.super Lorg/msgpack/template/AbstractTemplate;
.source "ReflectionTemplateBuilder.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/msgpack/template/builder/ReflectionTemplateBuilder;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xc
    name = "ReflectionClassTemplate"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Lorg/msgpack/template/AbstractTemplate",
        "<TT;>;"
    }
.end annotation


# instance fields
.field protected targetClass:Ljava/lang/Class;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/Class",
            "<TT;>;"
        }
    .end annotation
.end field

.field protected templates:[Lorg/msgpack/template/builder/ReflectionTemplateBuilder$ReflectionFieldTemplate;


# direct methods
.method protected constructor <init>(Ljava/lang/Class;[Lorg/msgpack/template/builder/ReflectionTemplateBuilder$ReflectionFieldTemplate;)V
    .registers 3
    .param p2, "templates"    # [Lorg/msgpack/template/builder/ReflectionTemplateBuilder$ReflectionFieldTemplate;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<TT;>;[",
            "Lorg/msgpack/template/builder/ReflectionTemplateBuilder$ReflectionFieldTemplate;",
            ")V"
        }
    .end annotation

    .prologue
    .line 83
    .local p0, "this":Lorg/msgpack/template/builder/ReflectionTemplateBuilder$ReflectionClassTemplate;, "Lorg/msgpack/template/builder/ReflectionTemplateBuilder$ReflectionClassTemplate<TT;>;"
    .local p1, "targetClass":Ljava/lang/Class;, "Ljava/lang/Class<TT;>;"
    invoke-direct {p0}, Lorg/msgpack/template/AbstractTemplate;-><init>()V

    .line 84
    iput-object p1, p0, Lorg/msgpack/template/builder/ReflectionTemplateBuilder$ReflectionClassTemplate;->targetClass:Ljava/lang/Class;

    .line 85
    iput-object p2, p0, Lorg/msgpack/template/builder/ReflectionTemplateBuilder$ReflectionClassTemplate;->templates:[Lorg/msgpack/template/builder/ReflectionTemplateBuilder$ReflectionFieldTemplate;

    .line 86
    return-void
.end method


# virtual methods
.method public read(Lorg/msgpack/unpacker/Unpacker;Ljava/lang/Object;Z)Ljava/lang/Object;
    .registers 8
    .param p1, "unpacker"    # Lorg/msgpack/unpacker/Unpacker;
    .param p3, "required"    # Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/msgpack/unpacker/Unpacker;",
            "TT;Z)TT;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 127
    .local p0, "this":Lorg/msgpack/template/builder/ReflectionTemplateBuilder$ReflectionClassTemplate;, "Lorg/msgpack/template/builder/ReflectionTemplateBuilder$ReflectionClassTemplate<TT;>;"
    .local p2, "to":Ljava/lang/Object;, "TT;"
    if-nez p3, :cond_a

    invoke-interface {p1}, Lorg/msgpack/unpacker/Unpacker;->trySkipNil()Z

    move-result v3

    if-eqz v3, :cond_a

    .line 128
    const/4 v3, 0x0

    .line 148
    :goto_9
    return-object v3

    .line 131
    :cond_a
    if-nez p2, :cond_12

    .line 132
    :try_start_c
    iget-object v3, p0, Lorg/msgpack/template/builder/ReflectionTemplateBuilder$ReflectionClassTemplate;->targetClass:Ljava/lang/Class;

    invoke-virtual {v3}, Ljava/lang/Class;->newInstance()Ljava/lang/Object;

    move-result-object p2

    .line 135
    :cond_12
    invoke-interface {p1}, Lorg/msgpack/unpacker/Unpacker;->readArrayBegin()I

    .line 136
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_16
    iget-object v3, p0, Lorg/msgpack/template/builder/ReflectionTemplateBuilder$ReflectionClassTemplate;->templates:[Lorg/msgpack/template/builder/ReflectionTemplateBuilder$ReflectionFieldTemplate;

    array-length v3, v3

    if-ge v1, v3, :cond_42

    .line 137
    iget-object v3, p0, Lorg/msgpack/template/builder/ReflectionTemplateBuilder$ReflectionClassTemplate;->templates:[Lorg/msgpack/template/builder/ReflectionTemplateBuilder$ReflectionFieldTemplate;

    aget-object v2, v3, v1

    .line 138
    .local v2, "tmpl":Lorg/msgpack/template/builder/ReflectionTemplateBuilder$ReflectionFieldTemplate;
    iget-object v3, v2, Lorg/msgpack/template/builder/ReflectionTemplateBuilder$ReflectionFieldTemplate;->entry:Lorg/msgpack/template/builder/FieldEntry;

    invoke-virtual {v3}, Lorg/msgpack/template/builder/FieldEntry;->isAvailable()Z

    move-result v3

    if-nez v3, :cond_2d

    .line 139
    invoke-interface {p1}, Lorg/msgpack/unpacker/Unpacker;->skip()V

    .line 136
    :cond_2a
    :goto_2a
    add-int/lit8 v1, v1, 0x1

    goto :goto_16

    .line 140
    :cond_2d
    iget-object v3, v2, Lorg/msgpack/template/builder/ReflectionTemplateBuilder$ReflectionFieldTemplate;->entry:Lorg/msgpack/template/builder/FieldEntry;

    invoke-virtual {v3}, Lorg/msgpack/template/builder/FieldEntry;->isOptional()Z

    move-result v3

    if-eqz v3, :cond_3b

    invoke-interface {p1}, Lorg/msgpack/unpacker/Unpacker;->trySkipNil()Z

    move-result v3

    if-nez v3, :cond_2a

    .line 143
    :cond_3b
    const/4 v3, 0x0

    invoke-virtual {v2, p1, p2, v3}, Lorg/msgpack/template/builder/ReflectionTemplateBuilder$ReflectionFieldTemplate;->read(Lorg/msgpack/unpacker/Unpacker;Ljava/lang/Object;Z)Ljava/lang/Object;
    :try_end_3f
    .catch Ljava/io/IOException; {:try_start_c .. :try_end_3f} :catch_40
    .catch Ljava/lang/Exception; {:try_start_c .. :try_end_3f} :catch_47

    goto :goto_2a

    .line 149
    .end local v1    # "i":I
    .end local v2    # "tmpl":Lorg/msgpack/template/builder/ReflectionTemplateBuilder$ReflectionFieldTemplate;
    :catch_40
    move-exception v0

    .line 150
    .local v0, "e":Ljava/io/IOException;
    throw v0

    .line 147
    .end local v0    # "e":Ljava/io/IOException;
    .restart local v1    # "i":I
    :cond_42
    :try_start_42
    invoke-interface {p1}, Lorg/msgpack/unpacker/Unpacker;->readArrayEnd()V
    :try_end_45
    .catch Ljava/io/IOException; {:try_start_42 .. :try_end_45} :catch_40
    .catch Ljava/lang/Exception; {:try_start_42 .. :try_end_45} :catch_47

    move-object v3, p2

    .line 148
    goto :goto_9

    .line 151
    .end local v1    # "i":I
    :catch_47
    move-exception v0

    .line 152
    .local v0, "e":Ljava/lang/Exception;
    new-instance v3, Lorg/msgpack/MessageTypeException;

    invoke-direct {v3, v0}, Lorg/msgpack/MessageTypeException;-><init>(Ljava/lang/Throwable;)V

    throw v3
.end method

.method public write(Lorg/msgpack/packer/Packer;Ljava/lang/Object;Z)V
    .registers 13
    .param p1, "packer"    # Lorg/msgpack/packer/Packer;
    .param p3, "required"    # Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/msgpack/packer/Packer;",
            "TT;Z)V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 91
    .local p0, "this":Lorg/msgpack/template/builder/ReflectionTemplateBuilder$ReflectionClassTemplate;, "Lorg/msgpack/template/builder/ReflectionTemplateBuilder$ReflectionClassTemplate<TT;>;"
    .local p2, "target":Ljava/lang/Object;, "TT;"
    if-nez p2, :cond_10

    .line 92
    if-eqz p3, :cond_c

    .line 93
    new-instance v6, Lorg/msgpack/MessageTypeException;

    const-string v7, "attempted to write null"

    invoke-direct {v6, v7}, Lorg/msgpack/MessageTypeException;-><init>(Ljava/lang/String;)V

    throw v6

    .line 95
    :cond_c
    invoke-interface {p1}, Lorg/msgpack/packer/Packer;->writeNil()Lorg/msgpack/packer/Packer;

    .line 122
    :goto_f
    return-void

    .line 99
    :cond_10
    :try_start_10
    iget-object v6, p0, Lorg/msgpack/template/builder/ReflectionTemplateBuilder$ReflectionClassTemplate;->templates:[Lorg/msgpack/template/builder/ReflectionTemplateBuilder$ReflectionFieldTemplate;

    array-length v6, v6

    invoke-interface {p1, v6}, Lorg/msgpack/packer/Packer;->writeArrayBegin(I)Lorg/msgpack/packer/Packer;

    .line 100
    iget-object v0, p0, Lorg/msgpack/template/builder/ReflectionTemplateBuilder$ReflectionClassTemplate;->templates:[Lorg/msgpack/template/builder/ReflectionTemplateBuilder$ReflectionFieldTemplate;

    .local v0, "arr$":[Lorg/msgpack/template/builder/ReflectionTemplateBuilder$ReflectionFieldTemplate;
    array-length v3, v0

    .local v3, "len$":I
    const/4 v2, 0x0

    .local v2, "i$":I
    :goto_1a
    if-ge v2, v3, :cond_6d

    aget-object v5, v0, v2

    .line 101
    .local v5, "tmpl":Lorg/msgpack/template/builder/ReflectionTemplateBuilder$ReflectionFieldTemplate;
    iget-object v6, v5, Lorg/msgpack/template/builder/ReflectionTemplateBuilder$ReflectionFieldTemplate;->entry:Lorg/msgpack/template/builder/FieldEntry;

    invoke-virtual {v6}, Lorg/msgpack/template/builder/FieldEntry;->isAvailable()Z

    move-result v6

    if-nez v6, :cond_2c

    .line 102
    invoke-interface {p1}, Lorg/msgpack/packer/Packer;->writeNil()Lorg/msgpack/packer/Packer;

    .line 100
    :goto_29
    add-int/lit8 v2, v2, 0x1

    goto :goto_1a

    .line 105
    :cond_2c
    iget-object v6, v5, Lorg/msgpack/template/builder/ReflectionTemplateBuilder$ReflectionFieldTemplate;->entry:Lorg/msgpack/template/builder/FieldEntry;

    invoke-virtual {v6, p2}, Lorg/msgpack/template/builder/FieldEntry;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    .line 106
    .local v4, "obj":Ljava/lang/Object;
    if-nez v4, :cond_68

    .line 107
    iget-object v6, v5, Lorg/msgpack/template/builder/ReflectionTemplateBuilder$ReflectionFieldTemplate;->entry:Lorg/msgpack/template/builder/FieldEntry;

    invoke-virtual {v6}, Lorg/msgpack/template/builder/FieldEntry;->isNotNullable()Z

    move-result v6

    if-eqz v6, :cond_5d

    .line 108
    new-instance v6, Lorg/msgpack/MessageTypeException;

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v8, v5, Lorg/msgpack/template/builder/ReflectionTemplateBuilder$ReflectionFieldTemplate;->entry:Lorg/msgpack/template/builder/FieldEntry;

    invoke-virtual {v8}, Lorg/msgpack/template/builder/FieldEntry;->getName()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, " cannot be null by @NotNullable"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-direct {v6, v7}, Lorg/msgpack/MessageTypeException;-><init>(Ljava/lang/String;)V

    throw v6
    :try_end_5b
    .catch Ljava/io/IOException; {:try_start_10 .. :try_end_5b} :catch_5b
    .catch Ljava/lang/Exception; {:try_start_10 .. :try_end_5b} :catch_61

    .line 117
    .end local v0    # "arr$":[Lorg/msgpack/template/builder/ReflectionTemplateBuilder$ReflectionFieldTemplate;
    .end local v2    # "i$":I
    .end local v3    # "len$":I
    .end local v4    # "obj":Ljava/lang/Object;
    .end local v5    # "tmpl":Lorg/msgpack/template/builder/ReflectionTemplateBuilder$ReflectionFieldTemplate;
    :catch_5b
    move-exception v1

    .line 118
    .local v1, "e":Ljava/io/IOException;
    throw v1

    .line 111
    .end local v1    # "e":Ljava/io/IOException;
    .restart local v0    # "arr$":[Lorg/msgpack/template/builder/ReflectionTemplateBuilder$ReflectionFieldTemplate;
    .restart local v2    # "i$":I
    .restart local v3    # "len$":I
    .restart local v4    # "obj":Ljava/lang/Object;
    .restart local v5    # "tmpl":Lorg/msgpack/template/builder/ReflectionTemplateBuilder$ReflectionFieldTemplate;
    :cond_5d
    :try_start_5d
    invoke-interface {p1}, Lorg/msgpack/packer/Packer;->writeNil()Lorg/msgpack/packer/Packer;
    :try_end_60
    .catch Ljava/io/IOException; {:try_start_5d .. :try_end_60} :catch_5b
    .catch Ljava/lang/Exception; {:try_start_5d .. :try_end_60} :catch_61

    goto :goto_29

    .line 119
    .end local v0    # "arr$":[Lorg/msgpack/template/builder/ReflectionTemplateBuilder$ReflectionFieldTemplate;
    .end local v2    # "i$":I
    .end local v3    # "len$":I
    .end local v4    # "obj":Ljava/lang/Object;
    .end local v5    # "tmpl":Lorg/msgpack/template/builder/ReflectionTemplateBuilder$ReflectionFieldTemplate;
    :catch_61
    move-exception v1

    .line 120
    .local v1, "e":Ljava/lang/Exception;
    new-instance v6, Lorg/msgpack/MessageTypeException;

    invoke-direct {v6, v1}, Lorg/msgpack/MessageTypeException;-><init>(Ljava/lang/Throwable;)V

    throw v6

    .line 113
    .end local v1    # "e":Ljava/lang/Exception;
    .restart local v0    # "arr$":[Lorg/msgpack/template/builder/ReflectionTemplateBuilder$ReflectionFieldTemplate;
    .restart local v2    # "i$":I
    .restart local v3    # "len$":I
    .restart local v4    # "obj":Ljava/lang/Object;
    .restart local v5    # "tmpl":Lorg/msgpack/template/builder/ReflectionTemplateBuilder$ReflectionFieldTemplate;
    :cond_68
    const/4 v6, 0x1

    :try_start_69
    invoke-virtual {v5, p1, v4, v6}, Lorg/msgpack/template/builder/ReflectionTemplateBuilder$ReflectionFieldTemplate;->write(Lorg/msgpack/packer/Packer;Ljava/lang/Object;Z)V

    goto :goto_29

    .line 116
    .end local v4    # "obj":Ljava/lang/Object;
    .end local v5    # "tmpl":Lorg/msgpack/template/builder/ReflectionTemplateBuilder$ReflectionFieldTemplate;
    :cond_6d
    invoke-interface {p1}, Lorg/msgpack/packer/Packer;->writeArrayEnd()Lorg/msgpack/packer/Packer;
    :try_end_70
    .catch Ljava/io/IOException; {:try_start_69 .. :try_end_70} :catch_5b
    .catch Ljava/lang/Exception; {:try_start_69 .. :try_end_70} :catch_61

    goto :goto_f
.end method
