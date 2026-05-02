.class Lcom/alibaba/fastjson/JSONPath$NotNullSegement;
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
    name = "NotNullSegement"
.end annotation


# instance fields
.field private final propertyName:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/String;)V
    .registers 2
    .param p1, "propertyName"    # Ljava/lang/String;

    .prologue
    .line 1128
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 1129
    iput-object p1, p0, Lcom/alibaba/fastjson/JSONPath$NotNullSegement;->propertyName:Ljava/lang/String;

    .line 1130
    return-void
.end method


# virtual methods
.method public apply(Lcom/alibaba/fastjson/JSONPath;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Z
    .registers 8
    .param p1, "path"    # Lcom/alibaba/fastjson/JSONPath;
    .param p2, "rootObject"    # Ljava/lang/Object;
    .param p3, "currentObject"    # Ljava/lang/Object;
    .param p4, "item"    # Ljava/lang/Object;

    .prologue
    const/4 v1, 0x0

    .line 1133
    iget-object v2, p0, Lcom/alibaba/fastjson/JSONPath$NotNullSegement;->propertyName:Ljava/lang/String;

    invoke-virtual {p1, p4, v2, v1}, Lcom/alibaba/fastjson/JSONPath;->getPropertyValue(Ljava/lang/Object;Ljava/lang/String;Z)Ljava/lang/Object;

    move-result-object v0

    .line 1135
    .local v0, "propertyValue":Ljava/lang/Object;
    if-eqz v0, :cond_a

    const/4 v1, 0x1

    :cond_a
    return v1
.end method
