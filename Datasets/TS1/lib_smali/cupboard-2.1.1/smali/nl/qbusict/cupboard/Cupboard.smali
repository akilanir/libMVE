.class public Lnl/qbusict/cupboard/Cupboard;
.super Ljava/lang/Object;
.source "Cupboard.java"


# instance fields
.field private final mConverterRegistry:Lnl/qbusict/cupboard/internal/convert/ConverterRegistry;

.field private mEntities:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set",
            "<",
            "Ljava/lang/Class",
            "<*>;>;"
        }
    .end annotation
.end field

.field private mUseAnnotations:Z


# direct methods
.method public constructor <init>()V
    .registers 3

    .prologue
    .line 100
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 96
    const/4 v0, 0x0

    iput-boolean v0, p0, Lnl/qbusict/cupboard/Cupboard;->mUseAnnotations:Z

    .line 98
    new-instance v0, Ljava/util/HashSet;

    const/16 v1, 0x80

    invoke-direct {v0, v1}, Ljava/util/HashSet;-><init>(I)V

    iput-object v0, p0, Lnl/qbusict/cupboard/Cupboard;->mEntities:Ljava/util/Set;

    .line 101
    new-instance v0, Lnl/qbusict/cupboard/internal/convert/ConverterRegistry;

    invoke-direct {v0, p0}, Lnl/qbusict/cupboard/internal/convert/ConverterRegistry;-><init>(Lnl/qbusict/cupboard/Cupboard;)V

    iput-object v0, p0, Lnl/qbusict/cupboard/Cupboard;->mConverterRegistry:Lnl/qbusict/cupboard/internal/convert/ConverterRegistry;

    .line 102
    return-void
.end method


# virtual methods
.method public getDelegateEntityConverter(Lnl/qbusict/cupboard/convert/EntityConverterFactory;Ljava/lang/Class;)Lnl/qbusict/cupboard/convert/EntityConverter;
    .registers 4
    .param p1, "skipPast"    # Lnl/qbusict/cupboard/convert/EntityConverterFactory;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Lnl/qbusict/cupboard/convert/EntityConverterFactory;",
            "Ljava/lang/Class",
            "<TT;>;)",
            "Lnl/qbusict/cupboard/convert/EntityConverter",
            "<TT;>;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalArgumentException;
        }
    .end annotation

    .prologue
    .line 244
    .local p2, "entityClass":Ljava/lang/Class;, "Ljava/lang/Class<TT;>;"
    iget-object v0, p0, Lnl/qbusict/cupboard/Cupboard;->mConverterRegistry:Lnl/qbusict/cupboard/internal/convert/ConverterRegistry;

    invoke-virtual {v0, p1, p2}, Lnl/qbusict/cupboard/internal/convert/ConverterRegistry;->getDelegateEntityConverter(Lnl/qbusict/cupboard/convert/EntityConverterFactory;Ljava/lang/Class;)Lnl/qbusict/cupboard/convert/EntityConverter;

    move-result-object v0

    return-object v0
.end method

.method public getDelegateFieldConverter(Lnl/qbusict/cupboard/convert/FieldConverterFactory;Ljava/lang/reflect/Type;)Lnl/qbusict/cupboard/convert/FieldConverter;
    .registers 4
    .param p1, "skipPast"    # Lnl/qbusict/cupboard/convert/FieldConverterFactory;
    .param p2, "type"    # Ljava/lang/reflect/Type;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lnl/qbusict/cupboard/convert/FieldConverterFactory;",
            "Ljava/lang/reflect/Type;",
            ")",
            "Lnl/qbusict/cupboard/convert/FieldConverter",
            "<*>;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalArgumentException;
        }
    .end annotation

    .prologue
    .line 230
    iget-object v0, p0, Lnl/qbusict/cupboard/Cupboard;->mConverterRegistry:Lnl/qbusict/cupboard/internal/convert/ConverterRegistry;

    invoke-virtual {v0, p1, p2}, Lnl/qbusict/cupboard/internal/convert/ConverterRegistry;->getDelegateFieldConverter(Lnl/qbusict/cupboard/convert/FieldConverterFactory;Ljava/lang/reflect/Type;)Lnl/qbusict/cupboard/convert/FieldConverter;

    move-result-object v0

    return-object v0
.end method

.method public getEntityConverter(Ljava/lang/Class;)Lnl/qbusict/cupboard/convert/EntityConverter;
    .registers 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/lang/Class",
            "<TT;>;)",
            "Lnl/qbusict/cupboard/convert/EntityConverter",
            "<TT;>;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalArgumentException;
        }
    .end annotation

    .prologue
    .line 214
    .local p1, "entityClass":Ljava/lang/Class;, "Ljava/lang/Class<TT;>;"
    invoke-virtual {p0, p1}, Lnl/qbusict/cupboard/Cupboard;->isRegisteredEntity(Ljava/lang/Class;)Z

    move-result v0

    if-nez v0, :cond_1f

    .line 215
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Entity is not registered: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 217
    :cond_1f
    iget-object v0, p0, Lnl/qbusict/cupboard/Cupboard;->mConverterRegistry:Lnl/qbusict/cupboard/internal/convert/ConverterRegistry;

    invoke-virtual {v0, p1}, Lnl/qbusict/cupboard/internal/convert/ConverterRegistry;->getEntityConverter(Ljava/lang/Class;)Lnl/qbusict/cupboard/convert/EntityConverter;

    move-result-object v0

    return-object v0
.end method

.method public getFieldConverter(Ljava/lang/reflect/Type;)Lnl/qbusict/cupboard/convert/FieldConverter;
    .registers 3
    .param p1, "type"    # Ljava/lang/reflect/Type;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/reflect/Type;",
            ")",
            "Lnl/qbusict/cupboard/convert/FieldConverter",
            "<*>;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalArgumentException;
        }
    .end annotation

    .prologue
    .line 202
    iget-object v0, p0, Lnl/qbusict/cupboard/Cupboard;->mConverterRegistry:Lnl/qbusict/cupboard/internal/convert/ConverterRegistry;

    invoke-virtual {v0, p1}, Lnl/qbusict/cupboard/internal/convert/ConverterRegistry;->getFieldConverter(Ljava/lang/reflect/Type;)Lnl/qbusict/cupboard/convert/FieldConverter;

    move-result-object v0

    return-object v0
.end method

.method public getRegisteredEntities()Ljava/util/Collection;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Collection",
            "<",
            "Ljava/lang/Class",
            "<*>;>;"
        }
    .end annotation

    .prologue
    .line 172
    iget-object v0, p0, Lnl/qbusict/cupboard/Cupboard;->mEntities:Ljava/util/Set;

    invoke-static {v0}, Ljava/util/Collections;->unmodifiableSet(Ljava/util/Set;)Ljava/util/Set;

    move-result-object v0

    return-object v0
.end method

.method public getTable(Ljava/lang/Class;)Ljava/lang/String;
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/lang/Class",
            "<TT;>;)",
            "Ljava/lang/String;"
        }
    .end annotation

    .prologue
    .line 164
    .local p1, "clz":Ljava/lang/Class;, "Ljava/lang/Class<TT;>;"
    invoke-virtual {p0, p1}, Lnl/qbusict/cupboard/Cupboard;->withEntity(Ljava/lang/Class;)Lnl/qbusict/cupboard/EntityCompartment;

    move-result-object v0

    invoke-virtual {v0}, Lnl/qbusict/cupboard/EntityCompartment;->getTable()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public isRegisteredEntity(Ljava/lang/Class;)Z
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<*>;)Z"
        }
    .end annotation

    .prologue
    .line 283
    .local p1, "entityClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    iget-object v0, p0, Lnl/qbusict/cupboard/Cupboard;->mEntities:Ljava/util/Set;

    invoke-interface {v0, p1}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method public isUseAnnotations()Z
    .registers 2

    .prologue
    .line 181
    iget-boolean v0, p0, Lnl/qbusict/cupboard/Cupboard;->mUseAnnotations:Z

    return v0
.end method

.method public register(Ljava/lang/Class;)V
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/lang/Class",
            "<TT;>;)V"
        }
    .end annotation

    .prologue
    .line 109
    .local p1, "clz":Ljava/lang/Class;, "Ljava/lang/Class<TT;>;"
    iget-object v0, p0, Lnl/qbusict/cupboard/Cupboard;->mEntities:Ljava/util/Set;

    invoke-interface {v0, p1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 110
    return-void
.end method

.method registerEntityConverterFactory(Lnl/qbusict/cupboard/convert/EntityConverterFactory;)V
    .registers 3
    .param p1, "factory"    # Lnl/qbusict/cupboard/convert/EntityConverterFactory;

    .prologue
    .line 253
    iget-object v0, p0, Lnl/qbusict/cupboard/Cupboard;->mConverterRegistry:Lnl/qbusict/cupboard/internal/convert/ConverterRegistry;

    invoke-virtual {v0, p1}, Lnl/qbusict/cupboard/internal/convert/ConverterRegistry;->registerEntityConverterFactory(Lnl/qbusict/cupboard/convert/EntityConverterFactory;)V

    .line 254
    return-void
.end method

.method registerFieldConverter(Ljava/lang/Class;Lnl/qbusict/cupboard/convert/FieldConverter;)V
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/lang/Class",
            "<TT;>;",
            "Lnl/qbusict/cupboard/convert/FieldConverter",
            "<TT;>;)V"
        }
    .end annotation

    .prologue
    .line 273
    .local p1, "fieldClass":Ljava/lang/Class;, "Ljava/lang/Class<TT;>;"
    .local p2, "converter":Lnl/qbusict/cupboard/convert/FieldConverter;, "Lnl/qbusict/cupboard/convert/FieldConverter<TT;>;"
    iget-object v0, p0, Lnl/qbusict/cupboard/Cupboard;->mConverterRegistry:Lnl/qbusict/cupboard/internal/convert/ConverterRegistry;

    invoke-virtual {v0, p1, p2}, Lnl/qbusict/cupboard/internal/convert/ConverterRegistry;->registerFieldConverter(Ljava/lang/Class;Lnl/qbusict/cupboard/convert/FieldConverter;)V

    .line 274
    return-void
.end method

.method registerFieldConverterFactory(Lnl/qbusict/cupboard/convert/FieldConverterFactory;)V
    .registers 3
    .param p1, "factory"    # Lnl/qbusict/cupboard/convert/FieldConverterFactory;

    .prologue
    .line 262
    iget-object v0, p0, Lnl/qbusict/cupboard/Cupboard;->mConverterRegistry:Lnl/qbusict/cupboard/internal/convert/ConverterRegistry;

    invoke-virtual {v0, p1}, Lnl/qbusict/cupboard/internal/convert/ConverterRegistry;->registerFieldConverterFactory(Lnl/qbusict/cupboard/convert/FieldConverterFactory;)V

    .line 263
    return-void
.end method

.method setUseAnnotations(Z)V
    .registers 2
    .param p1, "useAnnotations"    # Z

    .prologue
    .line 191
    iput-boolean p1, p0, Lnl/qbusict/cupboard/Cupboard;->mUseAnnotations:Z

    .line 192
    return-void
.end method

.method public withContext(Landroid/content/Context;)Lnl/qbusict/cupboard/ProviderCompartment;
    .registers 3
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 136
    new-instance v0, Lnl/qbusict/cupboard/ProviderCompartment;

    invoke-direct {v0, p0, p1}, Lnl/qbusict/cupboard/ProviderCompartment;-><init>(Lnl/qbusict/cupboard/Cupboard;Landroid/content/Context;)V

    return-object v0
.end method

.method public withCursor(Landroid/database/Cursor;)Lnl/qbusict/cupboard/CursorCompartment;
    .registers 3
    .param p1, "cursor"    # Landroid/database/Cursor;

    .prologue
    .line 127
    new-instance v0, Lnl/qbusict/cupboard/CursorCompartment;

    invoke-direct {v0, p0, p1}, Lnl/qbusict/cupboard/CursorCompartment;-><init>(Lnl/qbusict/cupboard/Cupboard;Landroid/database/Cursor;)V

    return-object v0
.end method

.method public withDatabase(Landroid/database/sqlite/SQLiteDatabase;)Lnl/qbusict/cupboard/DatabaseCompartment;
    .registers 3
    .param p1, "db"    # Landroid/database/sqlite/SQLiteDatabase;

    .prologue
    .line 118
    new-instance v0, Lnl/qbusict/cupboard/DatabaseCompartment;

    invoke-direct {v0, p0, p1}, Lnl/qbusict/cupboard/DatabaseCompartment;-><init>(Lnl/qbusict/cupboard/Cupboard;Landroid/database/sqlite/SQLiteDatabase;)V

    return-object v0
.end method

.method public withEntity(Ljava/lang/Class;)Lnl/qbusict/cupboard/EntityCompartment;
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/lang/Class",
            "<TT;>;)",
            "Lnl/qbusict/cupboard/EntityCompartment",
            "<TT;>;"
        }
    .end annotation

    .prologue
    .line 155
    .local p1, "entityClass":Ljava/lang/Class;, "Ljava/lang/Class<TT;>;"
    new-instance v0, Lnl/qbusict/cupboard/EntityCompartment;

    invoke-direct {v0, p0, p1}, Lnl/qbusict/cupboard/EntityCompartment;-><init>(Lnl/qbusict/cupboard/Cupboard;Ljava/lang/Class;)V

    return-object v0
.end method

.method public withOperations(Ljava/util/ArrayList;)Lnl/qbusict/cupboard/ProviderOperationsCompartment;
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList",
            "<",
            "Landroid/content/ContentProviderOperation;",
            ">;)",
            "Lnl/qbusict/cupboard/ProviderOperationsCompartment;"
        }
    .end annotation

    .prologue
    .line 145
    .local p1, "operations":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Landroid/content/ContentProviderOperation;>;"
    new-instance v0, Lnl/qbusict/cupboard/ProviderOperationsCompartment;

    invoke-direct {v0, p0, p1}, Lnl/qbusict/cupboard/ProviderOperationsCompartment;-><init>(Lnl/qbusict/cupboard/Cupboard;Ljava/util/ArrayList;)V

    return-object v0
.end method
