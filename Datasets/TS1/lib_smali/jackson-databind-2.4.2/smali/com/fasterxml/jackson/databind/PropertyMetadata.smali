.class public Lcom/fasterxml/jackson/databind/PropertyMetadata;
.super Ljava/lang/Object;
.source "PropertyMetadata.java"

# interfaces
.implements Ljava/io/Serializable;


# static fields
.field public static final STD_OPTIONAL:Lcom/fasterxml/jackson/databind/PropertyMetadata;

.field public static final STD_REQUIRED:Lcom/fasterxml/jackson/databind/PropertyMetadata;

.field public static final STD_REQUIRED_OR_OPTIONAL:Lcom/fasterxml/jackson/databind/PropertyMetadata;

.field private static final serialVersionUID:J = -0x1L


# instance fields
.field protected final _description:Ljava/lang/String;

.field protected final _index:Ljava/lang/Integer;

.field protected final _required:Ljava/lang/Boolean;


# direct methods
.method static constructor <clinit>()V
    .registers 3

    .prologue
    const/4 v2, 0x0

    .line 16
    new-instance v0, Lcom/fasterxml/jackson/databind/PropertyMetadata;

    sget-object v1, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    invoke-direct {v0, v1, v2, v2}, Lcom/fasterxml/jackson/databind/PropertyMetadata;-><init>(Ljava/lang/Boolean;Ljava/lang/String;Ljava/lang/Integer;)V

    sput-object v0, Lcom/fasterxml/jackson/databind/PropertyMetadata;->STD_REQUIRED:Lcom/fasterxml/jackson/databind/PropertyMetadata;

    .line 18
    new-instance v0, Lcom/fasterxml/jackson/databind/PropertyMetadata;

    sget-object v1, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    invoke-direct {v0, v1, v2, v2}, Lcom/fasterxml/jackson/databind/PropertyMetadata;-><init>(Ljava/lang/Boolean;Ljava/lang/String;Ljava/lang/Integer;)V

    sput-object v0, Lcom/fasterxml/jackson/databind/PropertyMetadata;->STD_OPTIONAL:Lcom/fasterxml/jackson/databind/PropertyMetadata;

    .line 20
    new-instance v0, Lcom/fasterxml/jackson/databind/PropertyMetadata;

    invoke-direct {v0, v2, v2, v2}, Lcom/fasterxml/jackson/databind/PropertyMetadata;-><init>(Ljava/lang/Boolean;Ljava/lang/String;Ljava/lang/Integer;)V

    sput-object v0, Lcom/fasterxml/jackson/databind/PropertyMetadata;->STD_REQUIRED_OR_OPTIONAL:Lcom/fasterxml/jackson/databind/PropertyMetadata;

    return-void
.end method

.method protected constructor <init>(Ljava/lang/Boolean;Ljava/lang/String;)V
    .registers 4
    .param p1, "req"    # Ljava/lang/Boolean;
    .param p2, "desc"    # Ljava/lang/String;
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 47
    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0}, Lcom/fasterxml/jackson/databind/PropertyMetadata;-><init>(Ljava/lang/Boolean;Ljava/lang/String;Ljava/lang/Integer;)V

    return-void
.end method

.method protected constructor <init>(Ljava/lang/Boolean;Ljava/lang/String;Ljava/lang/Integer;)V
    .registers 4
    .param p1, "req"    # Ljava/lang/Boolean;
    .param p2, "desc"    # Ljava/lang/String;
    .param p3, "index"    # Ljava/lang/Integer;

    .prologue
    .line 50
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 51
    iput-object p1, p0, Lcom/fasterxml/jackson/databind/PropertyMetadata;->_required:Ljava/lang/Boolean;

    .line 52
    iput-object p2, p0, Lcom/fasterxml/jackson/databind/PropertyMetadata;->_description:Ljava/lang/String;

    .line 53
    iput-object p3, p0, Lcom/fasterxml/jackson/databind/PropertyMetadata;->_index:Ljava/lang/Integer;

    .line 54
    return-void
.end method

.method public static construct(ZLjava/lang/String;)Lcom/fasterxml/jackson/databind/PropertyMetadata;
    .registers 3
    .param p0, "req"    # Z
    .param p1, "desc"    # Ljava/lang/String;
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 61
    const/4 v0, 0x0

    invoke-static {p0, p1, v0}, Lcom/fasterxml/jackson/databind/PropertyMetadata;->construct(ZLjava/lang/String;Ljava/lang/Integer;)Lcom/fasterxml/jackson/databind/PropertyMetadata;

    move-result-object v0

    return-object v0
.end method

.method public static construct(ZLjava/lang/String;Ljava/lang/Integer;)Lcom/fasterxml/jackson/databind/PropertyMetadata;
    .registers 4
    .param p0, "req"    # Z
    .param p1, "desc"    # Ljava/lang/String;
    .param p2, "index"    # Ljava/lang/Integer;

    .prologue
    .line 65
    if-eqz p0, :cond_11

    sget-object v0, Lcom/fasterxml/jackson/databind/PropertyMetadata;->STD_REQUIRED:Lcom/fasterxml/jackson/databind/PropertyMetadata;

    .line 66
    .local v0, "md":Lcom/fasterxml/jackson/databind/PropertyMetadata;
    :goto_4
    if-eqz p1, :cond_a

    .line 67
    invoke-virtual {v0, p1}, Lcom/fasterxml/jackson/databind/PropertyMetadata;->withDescription(Ljava/lang/String;)Lcom/fasterxml/jackson/databind/PropertyMetadata;

    move-result-object v0

    .line 69
    :cond_a
    if-eqz p2, :cond_10

    .line 70
    invoke-virtual {v0, p2}, Lcom/fasterxml/jackson/databind/PropertyMetadata;->withIndex(Ljava/lang/Integer;)Lcom/fasterxml/jackson/databind/PropertyMetadata;

    move-result-object v0

    .line 72
    :cond_10
    return-object v0

    .line 65
    .end local v0    # "md":Lcom/fasterxml/jackson/databind/PropertyMetadata;
    :cond_11
    sget-object v0, Lcom/fasterxml/jackson/databind/PropertyMetadata;->STD_OPTIONAL:Lcom/fasterxml/jackson/databind/PropertyMetadata;

    goto :goto_4
.end method


# virtual methods
.method public getDescription()Ljava/lang/String;
    .registers 2

    .prologue
    .line 117
    iget-object v0, p0, Lcom/fasterxml/jackson/databind/PropertyMetadata;->_description:Ljava/lang/String;

    return-object v0
.end method

.method public getIndex()Ljava/lang/Integer;
    .registers 2

    .prologue
    .line 126
    iget-object v0, p0, Lcom/fasterxml/jackson/databind/PropertyMetadata;->_index:Ljava/lang/Integer;

    return-object v0
.end method

.method public getRequired()Ljava/lang/Boolean;
    .registers 2

    .prologue
    .line 121
    iget-object v0, p0, Lcom/fasterxml/jackson/databind/PropertyMetadata;->_required:Ljava/lang/Boolean;

    return-object v0
.end method

.method public hasIndex()Z
    .registers 2

    .prologue
    .line 131
    iget-object v0, p0, Lcom/fasterxml/jackson/databind/PropertyMetadata;->_index:Ljava/lang/Integer;

    if-eqz v0, :cond_6

    const/4 v0, 0x1

    :goto_5
    return v0

    :cond_6
    const/4 v0, 0x0

    goto :goto_5
.end method

.method public isRequired()Z
    .registers 2

    .prologue
    .line 119
    iget-object v0, p0, Lcom/fasterxml/jackson/databind/PropertyMetadata;->_required:Ljava/lang/Boolean;

    if-eqz v0, :cond_e

    iget-object v0, p0, Lcom/fasterxml/jackson/databind/PropertyMetadata;->_required:Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    if-eqz v0, :cond_e

    const/4 v0, 0x1

    :goto_d
    return v0

    :cond_e
    const/4 v0, 0x0

    goto :goto_d
.end method

.method protected readResolve()Ljava/lang/Object;
    .registers 2

    .prologue
    .line 81
    iget-object v0, p0, Lcom/fasterxml/jackson/databind/PropertyMetadata;->_description:Ljava/lang/String;

    if-nez v0, :cond_1d

    iget-object v0, p0, Lcom/fasterxml/jackson/databind/PropertyMetadata;->_index:Ljava/lang/Integer;

    if-nez v0, :cond_1d

    .line 82
    iget-object v0, p0, Lcom/fasterxml/jackson/databind/PropertyMetadata;->_required:Ljava/lang/Boolean;

    if-nez v0, :cond_f

    .line 83
    sget-object v0, Lcom/fasterxml/jackson/databind/PropertyMetadata;->STD_REQUIRED_OR_OPTIONAL:Lcom/fasterxml/jackson/databind/PropertyMetadata;

    .line 87
    :goto_e
    return-object v0

    .line 85
    :cond_f
    iget-object v0, p0, Lcom/fasterxml/jackson/databind/PropertyMetadata;->_required:Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    if-eqz v0, :cond_1a

    sget-object v0, Lcom/fasterxml/jackson/databind/PropertyMetadata;->STD_REQUIRED:Lcom/fasterxml/jackson/databind/PropertyMetadata;

    goto :goto_e

    :cond_1a
    sget-object v0, Lcom/fasterxml/jackson/databind/PropertyMetadata;->STD_OPTIONAL:Lcom/fasterxml/jackson/databind/PropertyMetadata;

    goto :goto_e

    :cond_1d
    move-object v0, p0

    .line 87
    goto :goto_e
.end method

.method public withDescription(Ljava/lang/String;)Lcom/fasterxml/jackson/databind/PropertyMetadata;
    .registers 5
    .param p1, "desc"    # Ljava/lang/String;

    .prologue
    .line 91
    new-instance v0, Lcom/fasterxml/jackson/databind/PropertyMetadata;

    iget-object v1, p0, Lcom/fasterxml/jackson/databind/PropertyMetadata;->_required:Ljava/lang/Boolean;

    iget-object v2, p0, Lcom/fasterxml/jackson/databind/PropertyMetadata;->_index:Ljava/lang/Integer;

    invoke-direct {v0, v1, p1, v2}, Lcom/fasterxml/jackson/databind/PropertyMetadata;-><init>(Ljava/lang/Boolean;Ljava/lang/String;Ljava/lang/Integer;)V

    return-object v0
.end method

.method public withIndex(Ljava/lang/Integer;)Lcom/fasterxml/jackson/databind/PropertyMetadata;
    .registers 5
    .param p1, "index"    # Ljava/lang/Integer;

    .prologue
    .line 95
    new-instance v0, Lcom/fasterxml/jackson/databind/PropertyMetadata;

    iget-object v1, p0, Lcom/fasterxml/jackson/databind/PropertyMetadata;->_required:Ljava/lang/Boolean;

    iget-object v2, p0, Lcom/fasterxml/jackson/databind/PropertyMetadata;->_description:Ljava/lang/String;

    invoke-direct {v0, v1, v2, p1}, Lcom/fasterxml/jackson/databind/PropertyMetadata;-><init>(Ljava/lang/Boolean;Ljava/lang/String;Ljava/lang/Integer;)V

    return-object v0
.end method

.method public withRequired(Ljava/lang/Boolean;)Lcom/fasterxml/jackson/databind/PropertyMetadata;
    .registers 5
    .param p1, "b"    # Ljava/lang/Boolean;

    .prologue
    .line 99
    if-nez p1, :cond_7

    .line 100
    iget-object v0, p0, Lcom/fasterxml/jackson/databind/PropertyMetadata;->_required:Ljava/lang/Boolean;

    if-nez v0, :cond_17

    .line 108
    .end local p0    # "this":Lcom/fasterxml/jackson/databind/PropertyMetadata;
    :cond_6
    :goto_6
    return-object p0

    .line 104
    .restart local p0    # "this":Lcom/fasterxml/jackson/databind/PropertyMetadata;
    :cond_7
    iget-object v0, p0, Lcom/fasterxml/jackson/databind/PropertyMetadata;->_required:Ljava/lang/Boolean;

    if-eqz v0, :cond_17

    iget-object v0, p0, Lcom/fasterxml/jackson/databind/PropertyMetadata;->_required:Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v1

    if-eq v0, v1, :cond_6

    .line 108
    :cond_17
    new-instance v0, Lcom/fasterxml/jackson/databind/PropertyMetadata;

    iget-object v1, p0, Lcom/fasterxml/jackson/databind/PropertyMetadata;->_description:Ljava/lang/String;

    iget-object v2, p0, Lcom/fasterxml/jackson/databind/PropertyMetadata;->_index:Ljava/lang/Integer;

    invoke-direct {v0, p1, v1, v2}, Lcom/fasterxml/jackson/databind/PropertyMetadata;-><init>(Ljava/lang/Boolean;Ljava/lang/String;Ljava/lang/Integer;)V

    move-object p0, v0

    goto :goto_6
.end method
