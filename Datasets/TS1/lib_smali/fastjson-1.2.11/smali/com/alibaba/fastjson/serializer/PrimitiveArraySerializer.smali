.class public Lcom/alibaba/fastjson/serializer/PrimitiveArraySerializer;
.super Ljava/lang/Object;
.source "PrimitiveArraySerializer.java"

# interfaces
.implements Lcom/alibaba/fastjson/serializer/ObjectSerializer;


# static fields
.field public static instance:Lcom/alibaba/fastjson/serializer/PrimitiveArraySerializer;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 26
    new-instance v0, Lcom/alibaba/fastjson/serializer/PrimitiveArraySerializer;

    invoke-direct {v0}, Lcom/alibaba/fastjson/serializer/PrimitiveArraySerializer;-><init>()V

    sput-object v0, Lcom/alibaba/fastjson/serializer/PrimitiveArraySerializer;->instance:Lcom/alibaba/fastjson/serializer/PrimitiveArraySerializer;

    return-void
.end method

.method public constructor <init>()V
    .registers 1

    .prologue
    .line 24
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final write(Lcom/alibaba/fastjson/serializer/JSONSerializer;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/reflect/Type;I)V
    .registers 16
    .param p1, "serializer"    # Lcom/alibaba/fastjson/serializer/JSONSerializer;
    .param p2, "object"    # Ljava/lang/Object;
    .param p3, "fieldName"    # Ljava/lang/Object;
    .param p4, "fieldType"    # Ljava/lang/reflect/Type;
    .param p5, "features"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/16 v9, 0x5d

    const/16 v7, 0x5b

    const/16 v8, 0x2c

    .line 29
    iget-object v5, p1, Lcom/alibaba/fastjson/serializer/JSONSerializer;->out:Lcom/alibaba/fastjson/serializer/SerializeWriter;

    .line 31
    .local v5, "out":Lcom/alibaba/fastjson/serializer/SerializeWriter;
    if-nez p2, :cond_10

    .line 32
    sget-object v6, Lcom/alibaba/fastjson/serializer/SerializerFeature;->WriteNullListAsEmpty:Lcom/alibaba/fastjson/serializer/SerializerFeature;

    invoke-virtual {v5, v6}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->writeNull(Lcom/alibaba/fastjson/serializer/SerializerFeature;)V

    .line 135
    .end local p2    # "object":Ljava/lang/Object;
    :goto_f
    return-void

    .line 36
    .restart local p2    # "object":Ljava/lang/Object;
    :cond_10
    instance-of v6, p2, [I

    if-eqz v6, :cond_31

    .line 37
    check-cast p2, [I

    .end local p2    # "object":Ljava/lang/Object;
    move-object v0, p2

    check-cast v0, [I

    .line 38
    .local v0, "array":[I
    invoke-virtual {v5, v7}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->write(I)V

    .line 39
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_1d
    array-length v6, v0

    if-ge v2, v6, :cond_2d

    .line 40
    if-eqz v2, :cond_25

    .line 41
    invoke-virtual {v5, v8}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->write(I)V

    .line 43
    :cond_25
    aget v6, v0, v2

    invoke-virtual {v5, v6}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->writeInt(I)V

    .line 39
    add-int/lit8 v2, v2, 0x1

    goto :goto_1d

    .line 45
    :cond_2d
    invoke-virtual {v5, v9}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->write(I)V

    goto :goto_f

    .line 49
    .end local v0    # "array":[I
    .end local v2    # "i":I
    .restart local p2    # "object":Ljava/lang/Object;
    :cond_31
    instance-of v6, p2, [S

    if-eqz v6, :cond_52

    .line 50
    check-cast p2, [S

    .end local p2    # "object":Ljava/lang/Object;
    move-object v0, p2

    check-cast v0, [S

    .line 51
    .local v0, "array":[S
    invoke-virtual {v5, v7}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->write(I)V

    .line 52
    const/4 v2, 0x0

    .restart local v2    # "i":I
    :goto_3e
    array-length v6, v0

    if-ge v2, v6, :cond_4e

    .line 53
    if-eqz v2, :cond_46

    .line 54
    invoke-virtual {v5, v8}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->write(I)V

    .line 56
    :cond_46
    aget-short v6, v0, v2

    invoke-virtual {v5, v6}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->writeInt(I)V

    .line 52
    add-int/lit8 v2, v2, 0x1

    goto :goto_3e

    .line 58
    :cond_4e
    invoke-virtual {v5, v9}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->write(I)V

    goto :goto_f

    .line 62
    .end local v0    # "array":[S
    .end local v2    # "i":I
    .restart local p2    # "object":Ljava/lang/Object;
    :cond_52
    instance-of v6, p2, [J

    if-eqz v6, :cond_73

    .line 63
    check-cast p2, [J

    .end local p2    # "object":Ljava/lang/Object;
    move-object v0, p2

    check-cast v0, [J

    .line 65
    .local v0, "array":[J
    invoke-virtual {v5, v7}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->write(I)V

    .line 66
    const/4 v2, 0x0

    .restart local v2    # "i":I
    :goto_5f
    array-length v6, v0

    if-ge v2, v6, :cond_6f

    .line 67
    if-eqz v2, :cond_67

    .line 68
    invoke-virtual {v5, v8}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->write(I)V

    .line 70
    :cond_67
    aget-wide v6, v0, v2

    invoke-virtual {v5, v6, v7}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->writeLong(J)V

    .line 66
    add-int/lit8 v2, v2, 0x1

    goto :goto_5f

    .line 72
    :cond_6f
    invoke-virtual {v5, v9}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->write(I)V

    goto :goto_f

    .line 76
    .end local v0    # "array":[J
    .end local v2    # "i":I
    .restart local p2    # "object":Ljava/lang/Object;
    :cond_73
    instance-of v6, p2, [Z

    if-eqz v6, :cond_95

    .line 77
    check-cast p2, [Z

    .end local p2    # "object":Ljava/lang/Object;
    move-object v0, p2

    check-cast v0, [Z

    .line 78
    .local v0, "array":[Z
    invoke-virtual {v5, v7}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->write(I)V

    .line 79
    const/4 v2, 0x0

    .restart local v2    # "i":I
    :goto_80
    array-length v6, v0

    if-ge v2, v6, :cond_90

    .line 80
    if-eqz v2, :cond_88

    .line 81
    invoke-virtual {v5, v8}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->write(I)V

    .line 83
    :cond_88
    aget-boolean v6, v0, v2

    invoke-virtual {v5, v6}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->write(Z)V

    .line 79
    add-int/lit8 v2, v2, 0x1

    goto :goto_80

    .line 85
    :cond_90
    invoke-virtual {v5, v9}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->write(I)V

    goto/16 :goto_f

    .line 89
    .end local v0    # "array":[Z
    .end local v2    # "i":I
    .restart local p2    # "object":Ljava/lang/Object;
    :cond_95
    instance-of v6, p2, [F

    if-eqz v6, :cond_c5

    .line 90
    check-cast p2, [F

    .end local p2    # "object":Ljava/lang/Object;
    move-object v0, p2

    check-cast v0, [F

    .line 91
    .local v0, "array":[F
    invoke-virtual {v5, v7}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->write(I)V

    .line 92
    const/4 v2, 0x0

    .restart local v2    # "i":I
    :goto_a2
    array-length v6, v0

    if-ge v2, v6, :cond_c0

    .line 93
    if-eqz v2, :cond_aa

    .line 94
    invoke-virtual {v5, v8}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->write(I)V

    .line 97
    :cond_aa
    aget v3, v0, v2

    .line 98
    .local v3, "item":F
    invoke-static {v3}, Ljava/lang/Float;->isNaN(F)Z

    move-result v6

    if-eqz v6, :cond_b8

    .line 99
    invoke-virtual {v5}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->writeNull()V

    .line 92
    :goto_b5
    add-int/lit8 v2, v2, 0x1

    goto :goto_a2

    .line 101
    :cond_b8
    invoke-static {v3}, Ljava/lang/Float;->toString(F)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->append(Ljava/lang/CharSequence;)Lcom/alibaba/fastjson/serializer/SerializeWriter;

    goto :goto_b5

    .line 104
    .end local v3    # "item":F
    :cond_c0
    invoke-virtual {v5, v9}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->write(I)V

    goto/16 :goto_f

    .line 108
    .end local v0    # "array":[F
    .end local v2    # "i":I
    .restart local p2    # "object":Ljava/lang/Object;
    :cond_c5
    instance-of v6, p2, [D

    if-eqz v6, :cond_f5

    .line 109
    check-cast p2, [D

    .end local p2    # "object":Ljava/lang/Object;
    move-object v0, p2

    check-cast v0, [D

    .line 110
    .local v0, "array":[D
    invoke-virtual {v5, v7}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->write(I)V

    .line 111
    const/4 v2, 0x0

    .restart local v2    # "i":I
    :goto_d2
    array-length v6, v0

    if-ge v2, v6, :cond_f0

    .line 112
    if-eqz v2, :cond_da

    .line 113
    invoke-virtual {v5, v8}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->write(I)V

    .line 116
    :cond_da
    aget-wide v3, v0, v2

    .line 117
    .local v3, "item":D
    invoke-static {v3, v4}, Ljava/lang/Double;->isNaN(D)Z

    move-result v6

    if-eqz v6, :cond_e8

    .line 118
    invoke-virtual {v5}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->writeNull()V

    .line 111
    :goto_e5
    add-int/lit8 v2, v2, 0x1

    goto :goto_d2

    .line 120
    :cond_e8
    invoke-static {v3, v4}, Ljava/lang/Double;->toString(D)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->append(Ljava/lang/CharSequence;)Lcom/alibaba/fastjson/serializer/SerializeWriter;

    goto :goto_e5

    .line 123
    .end local v3    # "item":D
    :cond_f0
    invoke-virtual {v5, v9}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->write(I)V

    goto/16 :goto_f

    .line 127
    .end local v0    # "array":[D
    .end local v2    # "i":I
    .restart local p2    # "object":Ljava/lang/Object;
    :cond_f5
    instance-of v6, p2, [B

    if-eqz v6, :cond_103

    .line 128
    check-cast p2, [B

    .end local p2    # "object":Ljava/lang/Object;
    move-object v0, p2

    check-cast v0, [B

    .line 129
    .local v0, "array":[B
    invoke-virtual {v5, v0}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->writeByteArray([B)V

    goto/16 :goto_f

    .line 133
    .end local v0    # "array":[B
    .restart local p2    # "object":Ljava/lang/Object;
    :cond_103
    check-cast p2, [C

    .end local p2    # "object":Ljava/lang/Object;
    move-object v1, p2

    check-cast v1, [C

    .line 134
    .local v1, "chars":[C
    new-instance v6, Ljava/lang/String;

    invoke-direct {v6, v1}, Ljava/lang/String;-><init>([C)V

    invoke-virtual {v5, v6}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->writeString(Ljava/lang/String;)V

    goto/16 :goto_f
.end method
