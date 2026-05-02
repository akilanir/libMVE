.class Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;
.super Ljava/lang/Object;
.source "ASMSerializerFactory.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/alibaba/fastjson/serializer/ASMSerializerFactory;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "Context"
.end annotation


# static fields
.field static final features:I = 0x5

.field static fieldName:I = 0x0

.field static final obj:I = 0x2

.field static original:I = 0x0

.field static final paramFieldName:I = 0x3

.field static final paramFieldType:I = 0x4

.field static processValue:I = 0x0

.field static final serializer:I = 0x1


# instance fields
.field private final beanFeatures:I

.field private final beanSerializeFeatures:I

.field private final className:Ljava/lang/String;

.field private final getters:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lcom/alibaba/fastjson/util/FieldInfo;",
            ">;"
        }
    .end annotation
.end field

.field private final jsonType:Lcom/alibaba/fastjson/annotation/JSONType;

.field private nonContext:Z

.field private variantIndex:I

.field private variants:Ljava/util/Map;
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

.field private final writeDirect:Z


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 59
    const/4 v0, 0x6

    sput v0, Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;->fieldName:I

    .line 60
    const/4 v0, 0x7

    sput v0, Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;->original:I

    .line 61
    const/16 v0, 0x8

    sput v0, Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;->processValue:I

    return-void
.end method

.method public constructor <init>(Ljava/util/List;Lcom/alibaba/fastjson/annotation/JSONType;Ljava/lang/String;IZZ)V
    .registers 8
    .param p2, "jsonType"    # Lcom/alibaba/fastjson/annotation/JSONType;
    .param p3, "className"    # Ljava/lang/String;
    .param p4, "beanSerializeFeatures"    # I
    .param p5, "writeDirect"    # Z
    .param p6, "nonContext"    # Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lcom/alibaba/fastjson/util/FieldInfo;",
            ">;",
            "Lcom/alibaba/fastjson/annotation/JSONType;",
            "Ljava/lang/String;",
            "IZZ)V"
        }
    .end annotation

    .prologue
    .line 75
    .local p1, "getters":Ljava/util/List;, "Ljava/util/List<Lcom/alibaba/fastjson/util/FieldInfo;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 70
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;->variants:Ljava/util/Map;

    .line 71
    const/16 v0, 0x9

    iput v0, p0, Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;->variantIndex:I

    .line 76
    iput-object p1, p0, Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;->getters:Ljava/util/List;

    .line 77
    iput-object p2, p0, Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;->jsonType:Lcom/alibaba/fastjson/annotation/JSONType;

    .line 78
    iput-object p3, p0, Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;->className:Ljava/lang/String;

    .line 79
    iput p4, p0, Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;->beanSerializeFeatures:I

    .line 80
    iput-boolean p5, p0, Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;->writeDirect:Z

    .line 81
    iput-boolean p6, p0, Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;->nonContext:Z

    .line 82
    iget-boolean v0, p0, Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;->writeDirect:Z

    if-eqz v0, :cond_22

    .line 83
    const/16 v0, 0x8

    sput v0, Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;->processValue:I

    .line 85
    :cond_22
    if-eqz p2, :cond_2f

    .line 86
    invoke-interface {p2}, Lcom/alibaba/fastjson/annotation/JSONType;->serialzeFeatures()[Lcom/alibaba/fastjson/serializer/SerializerFeature;

    move-result-object v0

    invoke-static {v0}, Lcom/alibaba/fastjson/serializer/SerializerFeature;->of([Lcom/alibaba/fastjson/serializer/SerializerFeature;)I

    move-result v0

    :goto_2c
    iput v0, p0, Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;->beanFeatures:I

    .line 88
    return-void

    .line 86
    :cond_2f
    const/4 v0, 0x0

    goto :goto_2c
.end method

.method static synthetic access$000(Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;)Z
    .registers 2
    .param p0, "x0"    # Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;

    .prologue
    .line 52
    iget-boolean v0, p0, Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;->writeDirect:Z

    return v0
.end method

.method static synthetic access$100(Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;)I
    .registers 2
    .param p0, "x0"    # Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;

    .prologue
    .line 52
    iget v0, p0, Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;->variantIndex:I

    return v0
.end method

.method static synthetic access$200(Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;)Z
    .registers 2
    .param p0, "x0"    # Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;

    .prologue
    .line 52
    iget-boolean v0, p0, Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;->nonContext:Z

    return v0
.end method

.method static synthetic access$300(Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;)Ljava/lang/String;
    .registers 2
    .param p0, "x0"    # Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;

    .prologue
    .line 52
    iget-object v0, p0, Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;->className:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$400(Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;)I
    .registers 2
    .param p0, "x0"    # Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;

    .prologue
    .line 52
    iget v0, p0, Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;->beanFeatures:I

    return v0
.end method

.method static synthetic access$500(Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;)I
    .registers 2
    .param p0, "x0"    # Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;

    .prologue
    .line 52
    iget v0, p0, Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;->beanSerializeFeatures:I

    return v0
.end method

.method static synthetic access$600(Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;)Lcom/alibaba/fastjson/annotation/JSONType;
    .registers 2
    .param p0, "x0"    # Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;

    .prologue
    .line 52
    iget-object v0, p0, Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;->jsonType:Lcom/alibaba/fastjson/annotation/JSONType;

    return-object v0
.end method


# virtual methods
.method public getFieldOrinal(Ljava/lang/String;)I
    .registers 7
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 110
    const/4 v0, -0x1

    .line 111
    .local v0, "fieldIndex":I
    const/4 v1, 0x0

    .local v1, "i":I
    iget-object v4, p0, Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;->getters:Ljava/util/List;

    invoke-interface {v4}, Ljava/util/List;->size()I

    move-result v3

    .local v3, "size":I
    :goto_8
    if-ge v1, v3, :cond_1b

    .line 112
    iget-object v4, p0, Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;->getters:Ljava/util/List;

    invoke-interface {v4, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/alibaba/fastjson/util/FieldInfo;

    .line 113
    .local v2, "item":Lcom/alibaba/fastjson/util/FieldInfo;
    iget-object v4, v2, Lcom/alibaba/fastjson/util/FieldInfo;->name:Ljava/lang/String;

    invoke-virtual {v4, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_1c

    .line 114
    move v0, v1

    .line 118
    .end local v2    # "item":Lcom/alibaba/fastjson/util/FieldInfo;
    :cond_1b
    return v0

    .line 111
    .restart local v2    # "item":Lcom/alibaba/fastjson/util/FieldInfo;
    :cond_1c
    add-int/lit8 v1, v1, 0x1

    goto :goto_8
.end method

.method public var(Ljava/lang/String;)I
    .registers 6
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 91
    iget-object v1, p0, Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;->variants:Ljava/util/Map;

    invoke-interface {v1, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    .line 92
    .local v0, "i":Ljava/lang/Integer;
    if-nez v0, :cond_19

    .line 93
    iget-object v1, p0, Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;->variants:Ljava/util/Map;

    iget v2, p0, Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;->variantIndex:I

    add-int/lit8 v3, v2, 0x1

    iput v3, p0, Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;->variantIndex:I

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-interface {v1, p1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 95
    :cond_19
    iget-object v1, p0, Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;->variants:Ljava/util/Map;

    invoke-interface {v1, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    .end local v0    # "i":Ljava/lang/Integer;
    check-cast v0, Ljava/lang/Integer;

    .line 96
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
    .line 100
    iget-object v1, p0, Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;->variants:Ljava/util/Map;

    invoke-interface {v1, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    .line 101
    .local v0, "i":Ljava/lang/Integer;
    if-nez v0, :cond_1a

    .line 102
    iget-object v1, p0, Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;->variants:Ljava/util/Map;

    iget v2, p0, Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;->variantIndex:I

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-interface {v1, p1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 103
    iget v1, p0, Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;->variantIndex:I

    add-int/2addr v1, p2

    iput v1, p0, Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;->variantIndex:I

    .line 105
    :cond_1a
    iget-object v1, p0, Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;->variants:Ljava/util/Map;

    invoke-interface {v1, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    .end local v0    # "i":Ljava/lang/Integer;
    check-cast v0, Ljava/lang/Integer;

    .line 106
    .restart local v0    # "i":Ljava/lang/Integer;
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v1

    return v1
.end method
