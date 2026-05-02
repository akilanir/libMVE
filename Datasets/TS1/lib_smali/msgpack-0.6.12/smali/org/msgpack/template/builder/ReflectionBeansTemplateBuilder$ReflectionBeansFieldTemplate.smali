.class Lorg/msgpack/template/builder/ReflectionBeansTemplateBuilder$ReflectionBeansFieldTemplate;
.super Lorg/msgpack/template/builder/ReflectionTemplateBuilder$ReflectionFieldTemplate;
.source "ReflectionBeansTemplateBuilder.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/msgpack/template/builder/ReflectionBeansTemplateBuilder;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "ReflectionBeansFieldTemplate"
.end annotation


# direct methods
.method constructor <init>(Lorg/msgpack/template/builder/FieldEntry;)V
    .registers 2
    .param p1, "entry"    # Lorg/msgpack/template/builder/FieldEntry;

    .prologue
    .line 55
    invoke-direct {p0, p1}, Lorg/msgpack/template/builder/ReflectionTemplateBuilder$ReflectionFieldTemplate;-><init>(Lorg/msgpack/template/builder/FieldEntry;)V

    .line 56
    return-void
.end method


# virtual methods
.method public read(Lorg/msgpack/unpacker/Unpacker;Ljava/lang/Object;Z)Ljava/lang/Object;
    .registers 6
    .param p1, "unpacker"    # Lorg/msgpack/unpacker/Unpacker;
    .param p2, "to"    # Ljava/lang/Object;
    .param p3, "required"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 65
    iget-object v1, p0, Lorg/msgpack/template/builder/ReflectionBeansTemplateBuilder$ReflectionBeansFieldTemplate;->entry:Lorg/msgpack/template/builder/FieldEntry;

    invoke-virtual {v1}, Lorg/msgpack/template/builder/FieldEntry;->getType()Ljava/lang/Class;

    move-result-object v1

    invoke-interface {p1, v1}, Lorg/msgpack/unpacker/Unpacker;->read(Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v0

    .line 66
    .local v0, "o":Ljava/lang/Object;
    iget-object v1, p0, Lorg/msgpack/template/builder/ReflectionBeansTemplateBuilder$ReflectionBeansFieldTemplate;->entry:Lorg/msgpack/template/builder/FieldEntry;

    invoke-virtual {v1, p2, v0}, Lorg/msgpack/template/builder/FieldEntry;->set(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 67
    return-object v0
.end method

.method public write(Lorg/msgpack/packer/Packer;Ljava/lang/Object;Z)V
    .registers 4
    .param p1, "packer"    # Lorg/msgpack/packer/Packer;
    .param p2, "v"    # Ljava/lang/Object;
    .param p3, "required"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 60
    invoke-interface {p1, p2}, Lorg/msgpack/packer/Packer;->write(Ljava/lang/Object;)Lorg/msgpack/packer/Packer;

    .line 61
    return-void
.end method
