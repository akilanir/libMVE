.class Lcom/alibaba/fastjson/JSONPath$StringInSegement;
.super Ljava/lang/Object;
.source "JSONPath.java"

# interfaces
.implements Lcom/alibaba/fastjson/JSONPath$Filter;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/alibaba/fastjson/JSONPath;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "StringInSegement"
.end annotation


# instance fields
.field private final not:Z

.field private final propertyName:Ljava/lang/String;

.field private final values:[Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/String;[Ljava/lang/String;Z)V
    .registers 4
    .param p1, "propertyName"    # Ljava/lang/String;
    .param p2, "values"    # [Ljava/lang/String;
    .param p3, "not"    # Z

    .prologue
    .line 1266
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 1267
    iput-object p1, p0, Lcom/alibaba/fastjson/JSONPath$StringInSegement;->propertyName:Ljava/lang/String;

    .line 1268
    iput-object p2, p0, Lcom/alibaba/fastjson/JSONPath$StringInSegement;->values:[Ljava/lang/String;

    .line 1269
    iput-boolean p3, p0, Lcom/alibaba/fastjson/JSONPath$StringInSegement;->not:Z

    .line 1270
    return-void
.end method


# virtual methods
.method public apply(Lcom/alibaba/fastjson/JSONPath;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Z
    .registers 13
    .param p1, "path"    # Lcom/alibaba/fastjson/JSONPath;
    .param p2, "rootObject"    # Ljava/lang/Object;
    .param p3, "currentObject"    # Ljava/lang/Object;
    .param p4, "item"    # Ljava/lang/Object;

    .prologue
    const/4 v2, 0x1

    const/4 v3, 0x0

    .line 1273
    iget-object v4, p0, Lcom/alibaba/fastjson/JSONPath$StringInSegement;->propertyName:Ljava/lang/String;

    invoke-virtual {p1, p4, v4, v3}, Lcom/alibaba/fastjson/JSONPath;->getPropertyValue(Ljava/lang/Object;Ljava/lang/String;Z)Ljava/lang/Object;

    move-result-object v0

    .line 1275
    .local v0, "propertyValue":Ljava/lang/Object;
    iget-object v5, p0, Lcom/alibaba/fastjson/JSONPath$StringInSegement;->values:[Ljava/lang/String;

    array-length v6, v5

    move v4, v3

    :goto_c
    if-ge v4, v6, :cond_2a

    aget-object v1, v5, v4

    .line 1276
    .local v1, "value":Ljava/lang/String;
    if-ne v1, v0, :cond_19

    .line 1277
    iget-boolean v4, p0, Lcom/alibaba/fastjson/JSONPath$StringInSegement;->not:Z

    if-nez v4, :cond_17

    .line 1283
    .end local v1    # "value":Ljava/lang/String;
    :cond_16
    :goto_16
    return v2

    .restart local v1    # "value":Ljava/lang/String;
    :cond_17
    move v2, v3

    .line 1277
    goto :goto_16

    .line 1278
    :cond_19
    if-eqz v1, :cond_27

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_27

    .line 1279
    iget-boolean v4, p0, Lcom/alibaba/fastjson/JSONPath$StringInSegement;->not:Z

    if-eqz v4, :cond_16

    move v2, v3

    goto :goto_16

    .line 1275
    :cond_27
    add-int/lit8 v4, v4, 0x1

    goto :goto_c

    .line 1283
    .end local v1    # "value":Ljava/lang/String;
    :cond_2a
    iget-boolean v2, p0, Lcom/alibaba/fastjson/JSONPath$StringInSegement;->not:Z

    goto :goto_16
.end method
