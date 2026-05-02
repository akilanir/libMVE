.class Lcom/alibaba/fastjson/parser/deserializer/ASMDeserializerFactory$Context;
.super Ljava/lang/Object;
.source "ASMDeserializerFactory.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/alibaba/fastjson/parser/deserializer/ASMDeserializerFactory;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "Context"
.end annotation


# instance fields
.field private final beanInfo:Lcom/alibaba/fastjson/util/JavaBeanInfo;

.field private final className:Ljava/lang/String;

.field private final clazz:Ljava/lang/Class;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/Class",
            "<*>;"
        }
    .end annotation
.end field

.field private fieldInfoList:[Lcom/alibaba/fastjson/util/FieldInfo;

.field private variantIndex:I

.field private final variants:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ljava/lang/String;Lcom/alibaba/fastjson/parser/ParserConfig;Lcom/alibaba/fastjson/util/JavaBeanInfo;I)V
    .registers 6
    .param p1, "className"    # Ljava/lang/String;
    .param p2, "config"    # Lcom/alibaba/fastjson/parser/ParserConfig;
    .param p3, "beanInfo"    # Lcom/alibaba/fastjson/util/JavaBeanInfo;
    .param p4, "initVariantIndex"    # I

    .prologue
    .line 1394
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 1386
    const/4 v0, 0x5

    iput v0, p0, Lcom/alibaba/fastjson/parser/deserializer/ASMDeserializerFactory$Context;->variantIndex:I

    .line 1387
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/alibaba/fastjson/parser/deserializer/ASMDeserializerFactory$Context;->variants:Ljava/util/Map;

    .line 1395
    iput-object p1, p0, Lcom/alibaba/fastjson/parser/deserializer/ASMDeserializerFactory$Context;->className:Ljava/lang/String;

    .line 1396
    iget-object v0, p3, Lcom/alibaba/fastjson/util/JavaBeanInfo;->clazz:Ljava/lang/Class;

    iput-object v0, p0, Lcom/alibaba/fastjson/parser/deserializer/ASMDeserializerFactory$Context;->clazz:Ljava/lang/Class;

    .line 1397
    iput p4, p0, Lcom/alibaba/fastjson/parser/deserializer/ASMDeserializerFactory$Context;->variantIndex:I

    .line 1398
    iput-object p3, p0, Lcom/alibaba/fastjson/parser/deserializer/ASMDeserializerFactory$Context;->beanInfo:Lcom/alibaba/fastjson/util/JavaBeanInfo;

    .line 1399
    iget-object v0, p3, Lcom/alibaba/fastjson/util/JavaBeanInfo;->fields:[Lcom/alibaba/fastjson/util/FieldInfo;

    iput-object v0, p0, Lcom/alibaba/fastjson/parser/deserializer/ASMDeserializerFactory$Context;->fieldInfoList:[Lcom/alibaba/fastjson/util/FieldInfo;

    .line 1400
    return-void
.end method

.method static synthetic access$000(Lcom/alibaba/fastjson/parser/deserializer/ASMDeserializerFactory$Context;)Lcom/alibaba/fastjson/util/JavaBeanInfo;
    .registers 2
    .param p0, "x0"    # Lcom/alibaba/fastjson/parser/deserializer/ASMDeserializerFactory$Context;

    .prologue
    .line 1384
    iget-object v0, p0, Lcom/alibaba/fastjson/parser/deserializer/ASMDeserializerFactory$Context;->beanInfo:Lcom/alibaba/fastjson/util/JavaBeanInfo;

    return-object v0
.end method

.method static synthetic access$100(Lcom/alibaba/fastjson/parser/deserializer/ASMDeserializerFactory$Context;)I
    .registers 2
    .param p0, "x0"    # Lcom/alibaba/fastjson/parser/deserializer/ASMDeserializerFactory$Context;

    .prologue
    .line 1384
    iget v0, p0, Lcom/alibaba/fastjson/parser/deserializer/ASMDeserializerFactory$Context;->variantIndex:I

    return v0
.end method

.method static synthetic access$200(Lcom/alibaba/fastjson/parser/deserializer/ASMDeserializerFactory$Context;)[Lcom/alibaba/fastjson/util/FieldInfo;
    .registers 2
    .param p0, "x0"    # Lcom/alibaba/fastjson/parser/deserializer/ASMDeserializerFactory$Context;

    .prologue
    .line 1384
    iget-object v0, p0, Lcom/alibaba/fastjson/parser/deserializer/ASMDeserializerFactory$Context;->fieldInfoList:[Lcom/alibaba/fastjson/util/FieldInfo;

    return-object v0
.end method

.method static synthetic access$202(Lcom/alibaba/fastjson/parser/deserializer/ASMDeserializerFactory$Context;[Lcom/alibaba/fastjson/util/FieldInfo;)[Lcom/alibaba/fastjson/util/FieldInfo;
    .registers 2
    .param p0, "x0"    # Lcom/alibaba/fastjson/parser/deserializer/ASMDeserializerFactory$Context;
    .param p1, "x1"    # [Lcom/alibaba/fastjson/util/FieldInfo;

    .prologue
    .line 1384
    iput-object p1, p0, Lcom/alibaba/fastjson/parser/deserializer/ASMDeserializerFactory$Context;->fieldInfoList:[Lcom/alibaba/fastjson/util/FieldInfo;

    return-object p1
.end method

.method static synthetic access$300(Lcom/alibaba/fastjson/parser/deserializer/ASMDeserializerFactory$Context;)Ljava/lang/String;
    .registers 2
    .param p0, "x0"    # Lcom/alibaba/fastjson/parser/deserializer/ASMDeserializerFactory$Context;

    .prologue
    .line 1384
    iget-object v0, p0, Lcom/alibaba/fastjson/parser/deserializer/ASMDeserializerFactory$Context;->className:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$400(Lcom/alibaba/fastjson/parser/deserializer/ASMDeserializerFactory$Context;)Ljava/lang/Class;
    .registers 2
    .param p0, "x0"    # Lcom/alibaba/fastjson/parser/deserializer/ASMDeserializerFactory$Context;

    .prologue
    .line 1384
    iget-object v0, p0, Lcom/alibaba/fastjson/parser/deserializer/ASMDeserializerFactory$Context;->clazz:Ljava/lang/Class;

    return-object v0
.end method


# virtual methods
.method public getInstClass()Ljava/lang/Class;
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/lang/Class",
            "<*>;"
        }
    .end annotation

    .prologue
    .line 1403
    iget-object v1, p0, Lcom/alibaba/fastjson/parser/deserializer/ASMDeserializerFactory$Context;->beanInfo:Lcom/alibaba/fastjson/util/JavaBeanInfo;

    iget-object v0, v1, Lcom/alibaba/fastjson/util/JavaBeanInfo;->builderClass:Ljava/lang/Class;

    .line 1404
    .local v0, "instClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    if-nez v0, :cond_8

    .line 1405
    iget-object v0, p0, Lcom/alibaba/fastjson/parser/deserializer/ASMDeserializerFactory$Context;->clazz:Ljava/lang/Class;

    .line 1408
    :cond_8
    return-object v0
.end method

.method public var(Ljava/lang/String;)I
    .registers 6
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 1422
    iget-object v1, p0, Lcom/alibaba/fastjson/parser/deserializer/ASMDeserializerFactory$Context;->variants:Ljava/util/Map;

    invoke-interface {v1, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    .line 1423
    .local v0, "i":Ljava/lang/Integer;
    if-nez v0, :cond_19

    .line 1424
    iget-object v1, p0, Lcom/alibaba/fastjson/parser/deserializer/ASMDeserializerFactory$Context;->variants:Ljava/util/Map;

    iget v2, p0, Lcom/alibaba/fastjson/parser/deserializer/ASMDeserializerFactory$Context;->variantIndex:I

    add-int/lit8 v3, v2, 0x1

    iput v3, p0, Lcom/alibaba/fastjson/parser/deserializer/ASMDeserializerFactory$Context;->variantIndex:I

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-interface {v1, p1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1426
    :cond_19
    iget-object v1, p0, Lcom/alibaba/fastjson/parser/deserializer/ASMDeserializerFactory$Context;->variants:Ljava/util/Map;

    invoke-interface {v1, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    .end local v0    # "i":Ljava/lang/Integer;
    check-cast v0, Ljava/lang/Integer;

    .line 1427
    .restart local v0    # "i":Ljava/lang/Integer;
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v1

    return v1
.end method

.method public var(Ljava/lang/String;I)I
    .registers 6
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "increment"    # I

    .prologue
    .line 1412
    iget-object v1, p0, Lcom/alibaba/fastjson/parser/deserializer/ASMDeserializerFactory$Context;->variants:Ljava/util/Map;

    invoke-interface {v1, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    .line 1413
    .local v0, "i":Ljava/lang/Integer;
    if-nez v0, :cond_1a

    .line 1414
    iget-object v1, p0, Lcom/alibaba/fastjson/parser/deserializer/ASMDeserializerFactory$Context;->variants:Ljava/util/Map;

    iget v2, p0, Lcom/alibaba/fastjson/parser/deserializer/ASMDeserializerFactory$Context;->variantIndex:I

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-interface {v1, p1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1415
    iget v1, p0, Lcom/alibaba/fastjson/parser/deserializer/ASMDeserializerFactory$Context;->variantIndex:I

    add-int/2addr v1, p2

    iput v1, p0, Lcom/alibaba/fastjson/parser/deserializer/ASMDeserializerFactory$Context;->variantIndex:I

    .line 1417
    :cond_1a
    iget-object v1, p0, Lcom/alibaba/fastjson/parser/deserializer/ASMDeserializerFactory$Context;->variants:Ljava/util/Map;

    invoke-interface {v1, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    .end local v0    # "i":Ljava/lang/Integer;
    check-cast v0, Ljava/lang/Integer;

    .line 1418
    .restart local v0    # "i":Ljava/lang/Integer;
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v1

    return v1
.end method
