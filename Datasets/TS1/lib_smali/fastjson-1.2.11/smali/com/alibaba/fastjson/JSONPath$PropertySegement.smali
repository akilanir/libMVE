.class Lcom/alibaba/fastjson/JSONPath$PropertySegement;
.super Ljava/lang/Object;
.source "JSONPath.java"

# interfaces
.implements Lcom/alibaba/fastjson/JSONPath$Segement;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/alibaba/fastjson/JSONPath;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "PropertySegement"
.end annotation


# instance fields
.field private final propertyName:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/String;)V
    .registers 2
    .param p1, "propertyName"    # Ljava/lang/String;

    .prologue
    .line 1020
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 1021
    iput-object p1, p0, Lcom/alibaba/fastjson/JSONPath$PropertySegement;->propertyName:Ljava/lang/String;

    .line 1022
    return-void
.end method


# virtual methods
.method public eval(Lcom/alibaba/fastjson/JSONPath;Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .registers 6
    .param p1, "path"    # Lcom/alibaba/fastjson/JSONPath;
    .param p2, "rootObject"    # Ljava/lang/Object;
    .param p3, "currentObject"    # Ljava/lang/Object;

    .prologue
    .line 1025
    iget-object v0, p0, Lcom/alibaba/fastjson/JSONPath$PropertySegement;->propertyName:Ljava/lang/String;

    const/4 v1, 0x1

    invoke-virtual {p1, p3, v0, v1}, Lcom/alibaba/fastjson/JSONPath;->getPropertyValue(Ljava/lang/Object;Ljava/lang/String;Z)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public setValue(Lcom/alibaba/fastjson/JSONPath;Ljava/lang/Object;Ljava/lang/Object;)V
    .registers 5
    .param p1, "path"    # Lcom/alibaba/fastjson/JSONPath;
    .param p2, "parent"    # Ljava/lang/Object;
    .param p3, "value"    # Ljava/lang/Object;

    .prologue
    .line 1029
    iget-object v0, p0, Lcom/alibaba/fastjson/JSONPath$PropertySegement;->propertyName:Ljava/lang/String;

    invoke-virtual {p1, p2, v0, p3}, Lcom/alibaba/fastjson/JSONPath;->setPropertyValue(Ljava/lang/Object;Ljava/lang/String;Ljava/lang/Object;)Z

    .line 1030
    return-void
.end method
