.class Lfreemarker/core/HashLiteral$SequenceHash;
.super Ljava/lang/Object;
.source "HashLiteral.java"

# interfaces
.implements Lfreemarker/template/TemplateHashModelEx;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lfreemarker/core/HashLiteral;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "SequenceHash"
.end annotation


# instance fields
.field private keyCollection:Lfreemarker/template/TemplateCollectionModel;

.field private keyMap:Ljava/util/HashMap;

.field private final this$0:Lfreemarker/core/HashLiteral;

.field private valueCollection:Lfreemarker/template/TemplateCollectionModel;


# direct methods
.method constructor <init>(Lfreemarker/core/HashLiteral;Lfreemarker/core/Environment;)V
    .registers 12
    .param p2, "env"    # Lfreemarker/core/Environment;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lfreemarker/template/TemplateException;
        }
    .end annotation

    .prologue
    .line 137
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lfreemarker/core/HashLiteral$SequenceHash;->this$0:Lfreemarker/core/HashLiteral;

    .line 138
    new-instance v7, Ljava/util/HashMap;

    invoke-direct {v7}, Ljava/util/HashMap;-><init>()V

    iput-object v7, p0, Lfreemarker/core/HashLiteral$SequenceHash;->keyMap:Ljava/util/HashMap;

    .line 139
    new-instance v3, Ljava/util/ArrayList;

    invoke-static {p1}, Lfreemarker/core/HashLiteral;->access$000(Lfreemarker/core/HashLiteral;)I

    move-result v7

    invoke-direct {v3, v7}, Ljava/util/ArrayList;-><init>(I)V

    .line 140
    .local v3, "keyList":Ljava/util/ArrayList;
    new-instance v6, Ljava/util/ArrayList;

    invoke-static {p1}, Lfreemarker/core/HashLiteral;->access$000(Lfreemarker/core/HashLiteral;)I

    move-result v7

    invoke-direct {v6, v7}, Ljava/util/ArrayList;-><init>(I)V

    .line 141
    .local v6, "valueList":Ljava/util/ArrayList;
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_1f
    invoke-static {p1}, Lfreemarker/core/HashLiteral;->access$000(Lfreemarker/core/HashLiteral;)I

    move-result v7

    if-ge v0, v7, :cond_5a

    .line 142
    invoke-static {p1}, Lfreemarker/core/HashLiteral;->access$100(Lfreemarker/core/HashLiteral;)Ljava/util/ArrayList;

    move-result-object v7

    invoke-virtual {v7, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lfreemarker/core/Expression;

    .line 143
    .local v2, "keyExp":Lfreemarker/core/Expression;
    invoke-static {p1}, Lfreemarker/core/HashLiteral;->access$200(Lfreemarker/core/HashLiteral;)Ljava/util/ArrayList;

    move-result-object v7

    invoke-virtual {v7, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lfreemarker/core/Expression;

    .line 144
    .local v4, "valExp":Lfreemarker/core/Expression;
    invoke-virtual {v2, p2}, Lfreemarker/core/Expression;->evalAndCoerceToString(Lfreemarker/core/Environment;)Ljava/lang/String;

    move-result-object v1

    .line 145
    .local v1, "key":Ljava/lang/String;
    invoke-virtual {v4, p2}, Lfreemarker/core/Expression;->eval(Lfreemarker/core/Environment;)Lfreemarker/template/TemplateModel;

    move-result-object v5

    .line 146
    .local v5, "value":Lfreemarker/template/TemplateModel;
    if-eqz p2, :cond_49

    invoke-virtual {p2}, Lfreemarker/core/Environment;->isClassicCompatible()Z

    move-result v7

    if-nez v7, :cond_4c

    .line 147
    :cond_49
    invoke-virtual {v4, v5, p2}, Lfreemarker/core/Expression;->assertNonNull(Lfreemarker/template/TemplateModel;Lfreemarker/core/Environment;)V

    .line 149
    :cond_4c
    iget-object v7, p0, Lfreemarker/core/HashLiteral$SequenceHash;->keyMap:Ljava/util/HashMap;

    invoke-virtual {v7, v1, v5}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 150
    invoke-virtual {v3, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 151
    invoke-virtual {v6, v5}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 141
    add-int/lit8 v0, v0, 0x1

    goto :goto_1f

    .line 153
    .end local v1    # "key":Ljava/lang/String;
    .end local v2    # "keyExp":Lfreemarker/core/Expression;
    .end local v4    # "valExp":Lfreemarker/core/Expression;
    .end local v5    # "value":Lfreemarker/template/TemplateModel;
    :cond_5a
    new-instance v7, Lfreemarker/core/CollectionAndSequence;

    new-instance v8, Lfreemarker/template/SimpleSequence;

    invoke-direct {v8, v3}, Lfreemarker/template/SimpleSequence;-><init>(Ljava/util/Collection;)V

    invoke-direct {v7, v8}, Lfreemarker/core/CollectionAndSequence;-><init>(Lfreemarker/template/TemplateSequenceModel;)V

    iput-object v7, p0, Lfreemarker/core/HashLiteral$SequenceHash;->keyCollection:Lfreemarker/template/TemplateCollectionModel;

    .line 154
    new-instance v7, Lfreemarker/core/CollectionAndSequence;

    new-instance v8, Lfreemarker/template/SimpleSequence;

    invoke-direct {v8, v6}, Lfreemarker/template/SimpleSequence;-><init>(Ljava/util/Collection;)V

    invoke-direct {v7, v8}, Lfreemarker/core/CollectionAndSequence;-><init>(Lfreemarker/template/TemplateSequenceModel;)V

    iput-object v7, p0, Lfreemarker/core/HashLiteral$SequenceHash;->valueCollection:Lfreemarker/template/TemplateCollectionModel;

    .line 155
    return-void
.end method


# virtual methods
.method public get(Ljava/lang/String;)Lfreemarker/template/TemplateModel;
    .registers 3
    .param p1, "key"    # Ljava/lang/String;

    .prologue
    .line 170
    iget-object v0, p0, Lfreemarker/core/HashLiteral$SequenceHash;->keyMap:Ljava/util/HashMap;

    invoke-virtual {v0, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lfreemarker/template/TemplateModel;

    return-object v0
.end method

.method public isEmpty()Z
    .registers 2

    .prologue
    .line 174
    iget-object v0, p0, Lfreemarker/core/HashLiteral$SequenceHash;->this$0:Lfreemarker/core/HashLiteral;

    invoke-static {v0}, Lfreemarker/core/HashLiteral;->access$000(Lfreemarker/core/HashLiteral;)I

    move-result v0

    if-nez v0, :cond_a

    const/4 v0, 0x1

    :goto_9
    return v0

    :cond_a
    const/4 v0, 0x0

    goto :goto_9
.end method

.method public keys()Lfreemarker/template/TemplateCollectionModel;
    .registers 2

    .prologue
    .line 162
    iget-object v0, p0, Lfreemarker/core/HashLiteral$SequenceHash;->keyCollection:Lfreemarker/template/TemplateCollectionModel;

    return-object v0
.end method

.method public size()I
    .registers 2

    .prologue
    .line 158
    iget-object v0, p0, Lfreemarker/core/HashLiteral$SequenceHash;->this$0:Lfreemarker/core/HashLiteral;

    invoke-static {v0}, Lfreemarker/core/HashLiteral;->access$000(Lfreemarker/core/HashLiteral;)I

    move-result v0

    return v0
.end method

.method public values()Lfreemarker/template/TemplateCollectionModel;
    .registers 2

    .prologue
    .line 166
    iget-object v0, p0, Lfreemarker/core/HashLiteral$SequenceHash;->valueCollection:Lfreemarker/template/TemplateCollectionModel;

    return-object v0
.end method
