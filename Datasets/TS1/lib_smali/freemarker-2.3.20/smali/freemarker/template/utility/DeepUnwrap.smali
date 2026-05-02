.class public Lfreemarker/template/utility/DeepUnwrap;
.super Ljava/lang/Object;
.source "DeepUnwrap.java"


# static fields
.field private static final OBJECT_CLASS:Ljava/lang/Class;

.field static class$java$lang$Object:Ljava/lang/Class;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 79
    sget-object v0, Lfreemarker/template/utility/DeepUnwrap;->class$java$lang$Object:Ljava/lang/Class;

    if-nez v0, :cond_f

    const-string v0, "java.lang.Object"

    invoke-static {v0}, Lfreemarker/template/utility/DeepUnwrap;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    sput-object v0, Lfreemarker/template/utility/DeepUnwrap;->class$java$lang$Object:Ljava/lang/Class;

    :goto_c
    sput-object v0, Lfreemarker/template/utility/DeepUnwrap;->OBJECT_CLASS:Ljava/lang/Class;

    return-void

    :cond_f
    sget-object v0, Lfreemarker/template/utility/DeepUnwrap;->class$java$lang$Object:Ljava/lang/Class;

    goto :goto_c
.end method

.method public constructor <init>()V
    .registers 1

    .prologue
    .line 77
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static class$(Ljava/lang/String;)Ljava/lang/Class;
    .registers 4
    .param p0, "x0"    # Ljava/lang/String;

    .prologue
    .line 79
    :try_start_0
    invoke-static {p0}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;
    :try_end_3
    .catch Ljava/lang/ClassNotFoundException; {:try_start_0 .. :try_end_3} :catch_5

    move-result-object v1

    return-object v1

    :catch_5
    move-exception v0

    .local v0, "x1":Ljava/lang/ClassNotFoundException;
    new-instance v1, Ljava/lang/NoClassDefFoundError;

    invoke-virtual {v0}, Ljava/lang/ClassNotFoundException;->getMessage()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/NoClassDefFoundError;-><init>(Ljava/lang/String;)V

    throw v1
.end method

.method public static permissiveUnwrap(Lfreemarker/template/TemplateModel;)Ljava/lang/Object;
    .registers 2
    .param p0, "model"    # Lfreemarker/template/TemplateModel;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lfreemarker/template/TemplateModelException;
        }
    .end annotation

    .prologue
    .line 119
    const/4 v0, 0x1

    invoke-static {p0, v0}, Lfreemarker/template/utility/DeepUnwrap;->unwrap(Lfreemarker/template/TemplateModel;Z)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public static premissiveUnwrap(Lfreemarker/template/TemplateModel;)Ljava/lang/Object;
    .registers 2
    .param p0, "model"    # Lfreemarker/template/TemplateModel;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lfreemarker/template/TemplateModelException;
        }
    .end annotation

    .prologue
    .line 127
    const/4 v0, 0x1

    invoke-static {p0, v0}, Lfreemarker/template/utility/DeepUnwrap;->unwrap(Lfreemarker/template/TemplateModel;Z)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public static unwrap(Lfreemarker/template/TemplateModel;)Ljava/lang/Object;
    .registers 2
    .param p0, "model"    # Lfreemarker/template/TemplateModel;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lfreemarker/template/TemplateModelException;
        }
    .end annotation

    .prologue
    .line 110
    const/4 v0, 0x0

    invoke-static {p0, v0}, Lfreemarker/template/utility/DeepUnwrap;->unwrap(Lfreemarker/template/TemplateModel;Z)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method private static unwrap(Lfreemarker/template/TemplateModel;Lfreemarker/template/TemplateModel;Z)Ljava/lang/Object;
    .registers 15
    .param p0, "model"    # Lfreemarker/template/TemplateModel;
    .param p1, "nullModel"    # Lfreemarker/template/TemplateModel;
    .param p2, "permissive"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lfreemarker/template/TemplateModelException;
        }
    .end annotation

    .prologue
    .line 143
    instance-of v9, p0, Lfreemarker/template/AdapterTemplateModel;

    if-eqz v9, :cond_d

    .line 144
    check-cast p0, Lfreemarker/template/AdapterTemplateModel;

    .end local p0    # "model":Lfreemarker/template/TemplateModel;
    sget-object v9, Lfreemarker/template/utility/DeepUnwrap;->OBJECT_CLASS:Ljava/lang/Class;

    invoke-interface {p0, v9}, Lfreemarker/template/AdapterTemplateModel;->getAdaptedObject(Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v6

    .line 192
    :cond_c
    :goto_c
    return-object v6

    .line 146
    .restart local p0    # "model":Lfreemarker/template/TemplateModel;
    :cond_d
    instance-of v9, p0, Lfreemarker/ext/util/WrapperTemplateModel;

    if-eqz v9, :cond_18

    .line 147
    check-cast p0, Lfreemarker/ext/util/WrapperTemplateModel;

    .end local p0    # "model":Lfreemarker/template/TemplateModel;
    invoke-interface {p0}, Lfreemarker/ext/util/WrapperTemplateModel;->getWrappedObject()Ljava/lang/Object;

    move-result-object v6

    goto :goto_c

    .line 149
    .restart local p0    # "model":Lfreemarker/template/TemplateModel;
    :cond_18
    if-ne p0, p1, :cond_1c

    .line 150
    const/4 v6, 0x0

    goto :goto_c

    .line 152
    :cond_1c
    instance-of v9, p0, Lfreemarker/template/TemplateScalarModel;

    if-eqz v9, :cond_27

    .line 153
    check-cast p0, Lfreemarker/template/TemplateScalarModel;

    .end local p0    # "model":Lfreemarker/template/TemplateModel;
    invoke-interface {p0}, Lfreemarker/template/TemplateScalarModel;->getAsString()Ljava/lang/String;

    move-result-object v6

    goto :goto_c

    .line 155
    .restart local p0    # "model":Lfreemarker/template/TemplateModel;
    :cond_27
    instance-of v9, p0, Lfreemarker/template/TemplateNumberModel;

    if-eqz v9, :cond_32

    .line 156
    check-cast p0, Lfreemarker/template/TemplateNumberModel;

    .end local p0    # "model":Lfreemarker/template/TemplateModel;
    invoke-interface {p0}, Lfreemarker/template/TemplateNumberModel;->getAsNumber()Ljava/lang/Number;

    move-result-object v6

    goto :goto_c

    .line 158
    .restart local p0    # "model":Lfreemarker/template/TemplateModel;
    :cond_32
    instance-of v9, p0, Lfreemarker/template/TemplateDateModel;

    if-eqz v9, :cond_3d

    .line 159
    check-cast p0, Lfreemarker/template/TemplateDateModel;

    .end local p0    # "model":Lfreemarker/template/TemplateModel;
    invoke-interface {p0}, Lfreemarker/template/TemplateDateModel;->getAsDate()Ljava/util/Date;

    move-result-object v6

    goto :goto_c

    .line 161
    .restart local p0    # "model":Lfreemarker/template/TemplateModel;
    :cond_3d
    instance-of v9, p0, Lfreemarker/template/TemplateBooleanModel;

    if-eqz v9, :cond_50

    .line 162
    check-cast p0, Lfreemarker/template/TemplateBooleanModel;

    .end local p0    # "model":Lfreemarker/template/TemplateModel;
    invoke-interface {p0}, Lfreemarker/template/TemplateBooleanModel;->getAsBoolean()Z

    move-result v9

    if-eqz v9, :cond_4d

    sget-object v9, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    :goto_4b
    move-object v6, v9

    goto :goto_c

    :cond_4d
    sget-object v9, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    goto :goto_4b

    .line 164
    .restart local p0    # "model":Lfreemarker/template/TemplateModel;
    :cond_50
    instance-of v9, p0, Lfreemarker/template/TemplateSequenceModel;

    if-eqz v9, :cond_75

    move-object v8, p0

    .line 165
    check-cast v8, Lfreemarker/template/TemplateSequenceModel;

    .line 166
    .local v8, "seq":Lfreemarker/template/TemplateSequenceModel;
    new-instance v6, Ljava/util/ArrayList;

    invoke-interface {v8}, Lfreemarker/template/TemplateSequenceModel;->size()I

    move-result v9

    invoke-direct {v6, v9}, Ljava/util/ArrayList;-><init>(I)V

    .line 167
    .local v6, "list":Ljava/util/ArrayList;
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_61
    invoke-interface {v8}, Lfreemarker/template/TemplateSequenceModel;->size()I

    move-result v9

    if-ge v2, v9, :cond_c

    .line 168
    invoke-interface {v8, v2}, Lfreemarker/template/TemplateSequenceModel;->get(I)Lfreemarker/template/TemplateModel;

    move-result-object v9

    invoke-static {v9, p1, p2}, Lfreemarker/template/utility/DeepUnwrap;->unwrap(Lfreemarker/template/TemplateModel;Lfreemarker/template/TemplateModel;Z)Ljava/lang/Object;

    move-result-object v9

    invoke-virtual {v6, v9}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 167
    add-int/lit8 v2, v2, 0x1

    goto :goto_61

    .line 172
    .end local v2    # "i":I
    .end local v6    # "list":Ljava/util/ArrayList;
    .end local v8    # "seq":Lfreemarker/template/TemplateSequenceModel;
    :cond_75
    instance-of v9, p0, Lfreemarker/template/TemplateCollectionModel;

    if-eqz v9, :cond_97

    move-object v0, p0

    .line 173
    check-cast v0, Lfreemarker/template/TemplateCollectionModel;

    .line 174
    .local v0, "coll":Lfreemarker/template/TemplateCollectionModel;
    new-instance v6, Ljava/util/ArrayList;

    invoke-direct {v6}, Ljava/util/ArrayList;-><init>()V

    .line 175
    .restart local v6    # "list":Ljava/util/ArrayList;
    invoke-interface {v0}, Lfreemarker/template/TemplateCollectionModel;->iterator()Lfreemarker/template/TemplateModelIterator;

    move-result-object v3

    .line 176
    .local v3, "it":Lfreemarker/template/TemplateModelIterator;
    :goto_85
    invoke-interface {v3}, Lfreemarker/template/TemplateModelIterator;->hasNext()Z

    move-result v9

    if-eqz v9, :cond_c

    .line 177
    invoke-interface {v3}, Lfreemarker/template/TemplateModelIterator;->next()Lfreemarker/template/TemplateModel;

    move-result-object v9

    invoke-static {v9, p1, p2}, Lfreemarker/template/utility/DeepUnwrap;->unwrap(Lfreemarker/template/TemplateModel;Lfreemarker/template/TemplateModel;Z)Ljava/lang/Object;

    move-result-object v9

    invoke-virtual {v6, v9}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_85

    .line 181
    .end local v0    # "coll":Lfreemarker/template/TemplateCollectionModel;
    .end local v3    # "it":Lfreemarker/template/TemplateModelIterator;
    .end local v6    # "list":Ljava/util/ArrayList;
    :cond_97
    instance-of v9, p0, Lfreemarker/template/TemplateHashModelEx;

    if-eqz v9, :cond_ca

    move-object v1, p0

    .line 182
    check-cast v1, Lfreemarker/template/TemplateHashModelEx;

    .line 183
    .local v1, "hash":Lfreemarker/template/TemplateHashModelEx;
    new-instance v7, Ljava/util/HashMap;

    invoke-direct {v7}, Ljava/util/HashMap;-><init>()V

    .line 184
    .local v7, "map":Ljava/util/HashMap;
    invoke-interface {v1}, Lfreemarker/template/TemplateHashModelEx;->keys()Lfreemarker/template/TemplateCollectionModel;

    move-result-object v9

    invoke-interface {v9}, Lfreemarker/template/TemplateCollectionModel;->iterator()Lfreemarker/template/TemplateModelIterator;

    move-result-object v5

    .line 185
    .local v5, "keys":Lfreemarker/template/TemplateModelIterator;
    :goto_ab
    invoke-interface {v5}, Lfreemarker/template/TemplateModelIterator;->hasNext()Z

    move-result v9

    if-eqz v9, :cond_c7

    .line 186
    invoke-interface {v5}, Lfreemarker/template/TemplateModelIterator;->next()Lfreemarker/template/TemplateModel;

    move-result-object v9

    invoke-static {v9, p1, p2}, Lfreemarker/template/utility/DeepUnwrap;->unwrap(Lfreemarker/template/TemplateModel;Lfreemarker/template/TemplateModel;Z)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    .line 187
    .local v4, "key":Ljava/lang/String;
    invoke-interface {v1, v4}, Lfreemarker/template/TemplateHashModelEx;->get(Ljava/lang/String;)Lfreemarker/template/TemplateModel;

    move-result-object v9

    invoke-static {v9, p1, p2}, Lfreemarker/template/utility/DeepUnwrap;->unwrap(Lfreemarker/template/TemplateModel;Lfreemarker/template/TemplateModel;Z)Ljava/lang/Object;

    move-result-object v9

    invoke-virtual {v7, v4, v9}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_ab

    .end local v4    # "key":Ljava/lang/String;
    :cond_c7
    move-object v6, v7

    .line 189
    goto/16 :goto_c

    .line 191
    .end local v1    # "hash":Lfreemarker/template/TemplateHashModelEx;
    .end local v5    # "keys":Lfreemarker/template/TemplateModelIterator;
    .end local v7    # "map":Ljava/util/HashMap;
    :cond_ca
    if-eqz p2, :cond_cf

    move-object v6, p0

    .line 192
    goto/16 :goto_c

    .line 194
    :cond_cf
    new-instance v9, Lfreemarker/template/TemplateModelException;

    new-instance v10, Ljava/lang/StringBuffer;

    invoke-direct {v10}, Ljava/lang/StringBuffer;-><init>()V

    const-string v11, "Cannot deep-unwrap model of type "

    invoke-virtual {v10, v11}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v10

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v10, v11}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-direct {v9, v10}, Lfreemarker/template/TemplateModelException;-><init>(Ljava/lang/String;)V

    throw v9
.end method

.method private static unwrap(Lfreemarker/template/TemplateModel;Z)Ljava/lang/Object;
    .registers 6
    .param p0, "model"    # Lfreemarker/template/TemplateModel;
    .param p1, "permissive"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lfreemarker/template/TemplateModelException;
        }
    .end annotation

    .prologue
    .line 131
    invoke-static {}, Lfreemarker/core/Environment;->getCurrentEnvironment()Lfreemarker/core/Environment;

    move-result-object v0

    .line 132
    .local v0, "env":Lfreemarker/core/Environment;
    const/4 v1, 0x0

    .line 133
    .local v1, "nullModel":Lfreemarker/template/TemplateModel;
    if-eqz v0, :cond_12

    .line 134
    invoke-virtual {v0}, Lfreemarker/core/Environment;->getObjectWrapper()Lfreemarker/template/ObjectWrapper;

    move-result-object v2

    .line 135
    .local v2, "wrapper":Lfreemarker/template/ObjectWrapper;
    if-eqz v2, :cond_12

    .line 136
    const/4 v3, 0x0

    invoke-interface {v2, v3}, Lfreemarker/template/ObjectWrapper;->wrap(Ljava/lang/Object;)Lfreemarker/template/TemplateModel;

    move-result-object v1

    .line 139
    .end local v2    # "wrapper":Lfreemarker/template/ObjectWrapper;
    :cond_12
    invoke-static {p0, v1, p1}, Lfreemarker/template/utility/DeepUnwrap;->unwrap(Lfreemarker/template/TemplateModel;Lfreemarker/template/TemplateModel;Z)Ljava/lang/Object;

    move-result-object v3

    return-object v3
.end method
