.class public abstract Lcom/alibaba/fastjson/serializer/SerializeFilterable;
.super Ljava/lang/Object;
.source "SerializeFilterable.java"


# instance fields
.field protected afterFilters:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lcom/alibaba/fastjson/serializer/AfterFilter;",
            ">;"
        }
    .end annotation
.end field

.field protected beforeFilters:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lcom/alibaba/fastjson/serializer/BeforeFilter;",
            ">;"
        }
    .end annotation
.end field

.field protected contextValueFilters:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lcom/alibaba/fastjson/serializer/ContextValueFilter;",
            ">;"
        }
    .end annotation
.end field

.field protected labelFilters:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lcom/alibaba/fastjson/serializer/LabelFilter;",
            ">;"
        }
    .end annotation
.end field

.field protected nameFilters:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lcom/alibaba/fastjson/serializer/NameFilter;",
            ">;"
        }
    .end annotation
.end field

.field protected propertyFilters:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lcom/alibaba/fastjson/serializer/PropertyFilter;",
            ">;"
        }
    .end annotation
.end field

.field protected propertyPreFilters:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lcom/alibaba/fastjson/serializer/PropertyPreFilter;",
            ">;"
        }
    .end annotation
.end field

.field protected valueFilters:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lcom/alibaba/fastjson/serializer/ValueFilter;",
            ">;"
        }
    .end annotation
.end field

.field protected writeDirect:Z


# direct methods
.method public constructor <init>()V
    .registers 2

    .prologue
    const/4 v0, 0x0

    .line 6
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 8
    iput-object v0, p0, Lcom/alibaba/fastjson/serializer/SerializeFilterable;->beforeFilters:Ljava/util/List;

    .line 9
    iput-object v0, p0, Lcom/alibaba/fastjson/serializer/SerializeFilterable;->afterFilters:Ljava/util/List;

    .line 10
    iput-object v0, p0, Lcom/alibaba/fastjson/serializer/SerializeFilterable;->propertyFilters:Ljava/util/List;

    .line 11
    iput-object v0, p0, Lcom/alibaba/fastjson/serializer/SerializeFilterable;->valueFilters:Ljava/util/List;

    .line 12
    iput-object v0, p0, Lcom/alibaba/fastjson/serializer/SerializeFilterable;->nameFilters:Ljava/util/List;

    .line 13
    iput-object v0, p0, Lcom/alibaba/fastjson/serializer/SerializeFilterable;->propertyPreFilters:Ljava/util/List;

    .line 14
    iput-object v0, p0, Lcom/alibaba/fastjson/serializer/SerializeFilterable;->labelFilters:Ljava/util/List;

    .line 15
    iput-object v0, p0, Lcom/alibaba/fastjson/serializer/SerializeFilterable;->contextValueFilters:Ljava/util/List;

    .line 17
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/alibaba/fastjson/serializer/SerializeFilterable;->writeDirect:Z

    return-void
.end method


# virtual methods
.method public addFilter(Lcom/alibaba/fastjson/serializer/SerializeFilter;)V
    .registers 4
    .param p1, "filter"    # Lcom/alibaba/fastjson/serializer/SerializeFilter;

    .prologue
    .line 92
    if-nez p1, :cond_3

    .line 127
    .end local p1    # "filter":Lcom/alibaba/fastjson/serializer/SerializeFilter;
    :cond_2
    :goto_2
    return-void

    .line 96
    .restart local p1    # "filter":Lcom/alibaba/fastjson/serializer/SerializeFilter;
    :cond_3
    instance-of v0, p1, Lcom/alibaba/fastjson/serializer/PropertyPreFilter;

    if-eqz v0, :cond_11

    .line 97
    invoke-virtual {p0}, Lcom/alibaba/fastjson/serializer/SerializeFilterable;->getPropertyPreFilters()Ljava/util/List;

    move-result-object v1

    move-object v0, p1

    check-cast v0, Lcom/alibaba/fastjson/serializer/PropertyPreFilter;

    invoke-interface {v1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 100
    :cond_11
    instance-of v0, p1, Lcom/alibaba/fastjson/serializer/NameFilter;

    if-eqz v0, :cond_1f

    .line 101
    invoke-virtual {p0}, Lcom/alibaba/fastjson/serializer/SerializeFilterable;->getNameFilters()Ljava/util/List;

    move-result-object v1

    move-object v0, p1

    check-cast v0, Lcom/alibaba/fastjson/serializer/NameFilter;

    invoke-interface {v1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 104
    :cond_1f
    instance-of v0, p1, Lcom/alibaba/fastjson/serializer/ValueFilter;

    if-eqz v0, :cond_2d

    .line 105
    invoke-virtual {p0}, Lcom/alibaba/fastjson/serializer/SerializeFilterable;->getValueFilters()Ljava/util/List;

    move-result-object v1

    move-object v0, p1

    check-cast v0, Lcom/alibaba/fastjson/serializer/ValueFilter;

    invoke-interface {v1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 108
    :cond_2d
    instance-of v0, p1, Lcom/alibaba/fastjson/serializer/ContextValueFilter;

    if-eqz v0, :cond_3b

    .line 109
    invoke-virtual {p0}, Lcom/alibaba/fastjson/serializer/SerializeFilterable;->getContextValueFilters()Ljava/util/List;

    move-result-object v1

    move-object v0, p1

    check-cast v0, Lcom/alibaba/fastjson/serializer/ContextValueFilter;

    invoke-interface {v1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 112
    :cond_3b
    instance-of v0, p1, Lcom/alibaba/fastjson/serializer/PropertyFilter;

    if-eqz v0, :cond_49

    .line 113
    invoke-virtual {p0}, Lcom/alibaba/fastjson/serializer/SerializeFilterable;->getPropertyFilters()Ljava/util/List;

    move-result-object v1

    move-object v0, p1

    check-cast v0, Lcom/alibaba/fastjson/serializer/PropertyFilter;

    invoke-interface {v1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 116
    :cond_49
    instance-of v0, p1, Lcom/alibaba/fastjson/serializer/BeforeFilter;

    if-eqz v0, :cond_57

    .line 117
    invoke-virtual {p0}, Lcom/alibaba/fastjson/serializer/SerializeFilterable;->getBeforeFilters()Ljava/util/List;

    move-result-object v1

    move-object v0, p1

    check-cast v0, Lcom/alibaba/fastjson/serializer/BeforeFilter;

    invoke-interface {v1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 120
    :cond_57
    instance-of v0, p1, Lcom/alibaba/fastjson/serializer/AfterFilter;

    if-eqz v0, :cond_65

    .line 121
    invoke-virtual {p0}, Lcom/alibaba/fastjson/serializer/SerializeFilterable;->getAfterFilters()Ljava/util/List;

    move-result-object v1

    move-object v0, p1

    check-cast v0, Lcom/alibaba/fastjson/serializer/AfterFilter;

    invoke-interface {v1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 124
    :cond_65
    instance-of v0, p1, Lcom/alibaba/fastjson/serializer/LabelFilter;

    if-eqz v0, :cond_2

    .line 125
    invoke-virtual {p0}, Lcom/alibaba/fastjson/serializer/SerializeFilterable;->getLabelFilters()Ljava/util/List;

    move-result-object v0

    check-cast p1, Lcom/alibaba/fastjson/serializer/LabelFilter;

    .end local p1    # "filter":Lcom/alibaba/fastjson/serializer/SerializeFilter;
    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_2
.end method

.method public getAfterFilters()Ljava/util/List;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Lcom/alibaba/fastjson/serializer/AfterFilter;",
            ">;"
        }
    .end annotation

    .prologue
    .line 29
    iget-object v0, p0, Lcom/alibaba/fastjson/serializer/SerializeFilterable;->afterFilters:Ljava/util/List;

    if-nez v0, :cond_e

    .line 30
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/alibaba/fastjson/serializer/SerializeFilterable;->afterFilters:Ljava/util/List;

    .line 31
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/alibaba/fastjson/serializer/SerializeFilterable;->writeDirect:Z

    .line 34
    :cond_e
    iget-object v0, p0, Lcom/alibaba/fastjson/serializer/SerializeFilterable;->afterFilters:Ljava/util/List;

    return-object v0
.end method

.method public getBeforeFilters()Ljava/util/List;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Lcom/alibaba/fastjson/serializer/BeforeFilter;",
            ">;"
        }
    .end annotation

    .prologue
    .line 20
    iget-object v0, p0, Lcom/alibaba/fastjson/serializer/SerializeFilterable;->beforeFilters:Ljava/util/List;

    if-nez v0, :cond_e

    .line 21
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/alibaba/fastjson/serializer/SerializeFilterable;->beforeFilters:Ljava/util/List;

    .line 22
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/alibaba/fastjson/serializer/SerializeFilterable;->writeDirect:Z

    .line 25
    :cond_e
    iget-object v0, p0, Lcom/alibaba/fastjson/serializer/SerializeFilterable;->beforeFilters:Ljava/util/List;

    return-object v0
.end method

.method public getContextValueFilters()Ljava/util/List;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Lcom/alibaba/fastjson/serializer/ContextValueFilter;",
            ">;"
        }
    .end annotation

    .prologue
    .line 74
    iget-object v0, p0, Lcom/alibaba/fastjson/serializer/SerializeFilterable;->contextValueFilters:Ljava/util/List;

    if-nez v0, :cond_e

    .line 75
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/alibaba/fastjson/serializer/SerializeFilterable;->contextValueFilters:Ljava/util/List;

    .line 76
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/alibaba/fastjson/serializer/SerializeFilterable;->writeDirect:Z

    .line 79
    :cond_e
    iget-object v0, p0, Lcom/alibaba/fastjson/serializer/SerializeFilterable;->contextValueFilters:Ljava/util/List;

    return-object v0
.end method

.method public getLabelFilters()Ljava/util/List;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Lcom/alibaba/fastjson/serializer/LabelFilter;",
            ">;"
        }
    .end annotation

    .prologue
    .line 56
    iget-object v0, p0, Lcom/alibaba/fastjson/serializer/SerializeFilterable;->labelFilters:Ljava/util/List;

    if-nez v0, :cond_e

    .line 57
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/alibaba/fastjson/serializer/SerializeFilterable;->labelFilters:Ljava/util/List;

    .line 58
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/alibaba/fastjson/serializer/SerializeFilterable;->writeDirect:Z

    .line 61
    :cond_e
    iget-object v0, p0, Lcom/alibaba/fastjson/serializer/SerializeFilterable;->labelFilters:Ljava/util/List;

    return-object v0
.end method

.method public getNameFilters()Ljava/util/List;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Lcom/alibaba/fastjson/serializer/NameFilter;",
            ">;"
        }
    .end annotation

    .prologue
    .line 38
    iget-object v0, p0, Lcom/alibaba/fastjson/serializer/SerializeFilterable;->nameFilters:Ljava/util/List;

    if-nez v0, :cond_e

    .line 39
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/alibaba/fastjson/serializer/SerializeFilterable;->nameFilters:Ljava/util/List;

    .line 40
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/alibaba/fastjson/serializer/SerializeFilterable;->writeDirect:Z

    .line 43
    :cond_e
    iget-object v0, p0, Lcom/alibaba/fastjson/serializer/SerializeFilterable;->nameFilters:Ljava/util/List;

    return-object v0
.end method

.method public getPropertyFilters()Ljava/util/List;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Lcom/alibaba/fastjson/serializer/PropertyFilter;",
            ">;"
        }
    .end annotation

    .prologue
    .line 65
    iget-object v0, p0, Lcom/alibaba/fastjson/serializer/SerializeFilterable;->propertyFilters:Ljava/util/List;

    if-nez v0, :cond_e

    .line 66
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/alibaba/fastjson/serializer/SerializeFilterable;->propertyFilters:Ljava/util/List;

    .line 67
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/alibaba/fastjson/serializer/SerializeFilterable;->writeDirect:Z

    .line 70
    :cond_e
    iget-object v0, p0, Lcom/alibaba/fastjson/serializer/SerializeFilterable;->propertyFilters:Ljava/util/List;

    return-object v0
.end method

.method public getPropertyPreFilters()Ljava/util/List;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Lcom/alibaba/fastjson/serializer/PropertyPreFilter;",
            ">;"
        }
    .end annotation

    .prologue
    .line 47
    iget-object v0, p0, Lcom/alibaba/fastjson/serializer/SerializeFilterable;->propertyPreFilters:Ljava/util/List;

    if-nez v0, :cond_e

    .line 48
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/alibaba/fastjson/serializer/SerializeFilterable;->propertyPreFilters:Ljava/util/List;

    .line 49
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/alibaba/fastjson/serializer/SerializeFilterable;->writeDirect:Z

    .line 52
    :cond_e
    iget-object v0, p0, Lcom/alibaba/fastjson/serializer/SerializeFilterable;->propertyPreFilters:Ljava/util/List;

    return-object v0
.end method

.method public getValueFilters()Ljava/util/List;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Lcom/alibaba/fastjson/serializer/ValueFilter;",
            ">;"
        }
    .end annotation

    .prologue
    .line 83
    iget-object v0, p0, Lcom/alibaba/fastjson/serializer/SerializeFilterable;->valueFilters:Ljava/util/List;

    if-nez v0, :cond_e

    .line 84
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/alibaba/fastjson/serializer/SerializeFilterable;->valueFilters:Ljava/util/List;

    .line 85
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/alibaba/fastjson/serializer/SerializeFilterable;->writeDirect:Z

    .line 88
    :cond_e
    iget-object v0, p0, Lcom/alibaba/fastjson/serializer/SerializeFilterable;->valueFilters:Ljava/util/List;

    return-object v0
.end method
