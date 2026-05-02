.class abstract Lfreemarker/core/BuiltIn;
.super Lfreemarker/core/Expression;
.source "BuiltIn.java"

# interfaces
.implements Ljava/lang/Cloneable;


# static fields
.field static final builtins:Ljava/util/HashMap;

.field private static final logger:Lfreemarker/log/Logger;


# instance fields
.field protected key:Ljava/lang/String;

.field protected target:Lfreemarker/core/Expression;


# direct methods
.method static constructor <clinit>()V
    .registers 10

    .prologue
    const/4 v9, 0x6

    const/4 v8, 0x5

    const/4 v7, 0x4

    const/4 v6, 0x0

    const/4 v5, 0x1

    .line 120
    const-string v1, "freemarker.runtime"

    invoke-static {v1}, Lfreemarker/log/Logger;->getLogger(Ljava/lang/String;)Lfreemarker/log/Logger;

    move-result-object v1

    sput-object v1, Lfreemarker/core/BuiltIn;->logger:Lfreemarker/log/Logger;

    .line 125
    new-instance v1, Ljava/util/HashMap;

    invoke-direct {v1}, Ljava/util/HashMap;-><init>()V

    sput-object v1, Lfreemarker/core/BuiltIn;->builtins:Ljava/util/HashMap;

    .line 127
    sget-object v1, Lfreemarker/core/BuiltIn;->builtins:Ljava/util/HashMap;

    const-string v2, "abs"

    new-instance v3, Lfreemarker/core/NumericalBuiltins$absBI;

    invoke-direct {v3}, Lfreemarker/core/NumericalBuiltins$absBI;-><init>()V

    invoke-virtual {v1, v2, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 128
    sget-object v1, Lfreemarker/core/BuiltIn;->builtins:Ljava/util/HashMap;

    const-string v2, "ancestors"

    new-instance v3, Lfreemarker/core/NodeBuiltins$ancestorsBI;

    invoke-direct {v3}, Lfreemarker/core/NodeBuiltins$ancestorsBI;-><init>()V

    invoke-virtual {v1, v2, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 129
    sget-object v1, Lfreemarker/core/BuiltIn;->builtins:Ljava/util/HashMap;

    const-string v2, "byte"

    new-instance v3, Lfreemarker/core/NumericalBuiltins$byteBI;

    invoke-direct {v3}, Lfreemarker/core/NumericalBuiltins$byteBI;-><init>()V

    invoke-virtual {v1, v2, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 130
    sget-object v1, Lfreemarker/core/BuiltIn;->builtins:Ljava/util/HashMap;

    const-string v2, "c"

    new-instance v3, Lfreemarker/core/MiscellaneousBuiltins$cBI;

    invoke-direct {v3}, Lfreemarker/core/MiscellaneousBuiltins$cBI;-><init>()V

    invoke-virtual {v1, v2, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 131
    sget-object v1, Lfreemarker/core/BuiltIn;->builtins:Ljava/util/HashMap;

    const-string v2, "cap_first"

    new-instance v3, Lfreemarker/core/StringBuiltins$cap_firstBI;

    invoke-direct {v3}, Lfreemarker/core/StringBuiltins$cap_firstBI;-><init>()V

    invoke-virtual {v1, v2, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 132
    sget-object v1, Lfreemarker/core/BuiltIn;->builtins:Ljava/util/HashMap;

    const-string v2, "capitalize"

    new-instance v3, Lfreemarker/core/StringBuiltins$capitalizeBI;

    invoke-direct {v3}, Lfreemarker/core/StringBuiltins$capitalizeBI;-><init>()V

    invoke-virtual {v1, v2, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 133
    sget-object v1, Lfreemarker/core/BuiltIn;->builtins:Ljava/util/HashMap;

    const-string v2, "ceiling"

    new-instance v3, Lfreemarker/core/NumericalBuiltins$ceilingBI;

    invoke-direct {v3}, Lfreemarker/core/NumericalBuiltins$ceilingBI;-><init>()V

    invoke-virtual {v1, v2, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 134
    sget-object v1, Lfreemarker/core/BuiltIn;->builtins:Ljava/util/HashMap;

    const-string v2, "children"

    new-instance v3, Lfreemarker/core/NodeBuiltins$childrenBI;

    invoke-direct {v3}, Lfreemarker/core/NodeBuiltins$childrenBI;-><init>()V

    invoke-virtual {v1, v2, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 135
    sget-object v1, Lfreemarker/core/BuiltIn;->builtins:Ljava/util/HashMap;

    const-string v2, "chop_linebreak"

    new-instance v3, Lfreemarker/core/StringBuiltins$chop_linebreakBI;

    invoke-direct {v3}, Lfreemarker/core/StringBuiltins$chop_linebreakBI;-><init>()V

    invoke-virtual {v1, v2, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 136
    sget-object v1, Lfreemarker/core/BuiltIn;->builtins:Ljava/util/HashMap;

    const-string v2, "contains"

    new-instance v3, Lfreemarker/core/StringBuiltins$containsBI;

    invoke-direct {v3}, Lfreemarker/core/StringBuiltins$containsBI;-><init>()V

    invoke-virtual {v1, v2, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 137
    sget-object v1, Lfreemarker/core/BuiltIn;->builtins:Ljava/util/HashMap;

    const-string v2, "date"

    new-instance v3, Lfreemarker/core/MiscellaneousBuiltins$dateBI;

    const/4 v4, 0x2

    invoke-direct {v3, v4}, Lfreemarker/core/MiscellaneousBuiltins$dateBI;-><init>(I)V

    invoke-virtual {v1, v2, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 138
    sget-object v1, Lfreemarker/core/BuiltIn;->builtins:Ljava/util/HashMap;

    const-string v2, "datetime"

    new-instance v3, Lfreemarker/core/MiscellaneousBuiltins$dateBI;

    const/4 v4, 0x3

    invoke-direct {v3, v4}, Lfreemarker/core/MiscellaneousBuiltins$dateBI;-><init>(I)V

    invoke-virtual {v1, v2, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 139
    sget-object v1, Lfreemarker/core/BuiltIn;->builtins:Ljava/util/HashMap;

    const-string v2, "default"

    new-instance v3, Lfreemarker/core/ExistenceBuiltins$defaultBI;

    invoke-direct {v3}, Lfreemarker/core/ExistenceBuiltins$defaultBI;-><init>()V

    invoke-virtual {v1, v2, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 140
    sget-object v1, Lfreemarker/core/BuiltIn;->builtins:Ljava/util/HashMap;

    const-string v2, "double"

    new-instance v3, Lfreemarker/core/NumericalBuiltins$doubleBI;

    invoke-direct {v3}, Lfreemarker/core/NumericalBuiltins$doubleBI;-><init>()V

    invoke-virtual {v1, v2, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 141
    sget-object v1, Lfreemarker/core/BuiltIn;->builtins:Ljava/util/HashMap;

    const-string v2, "ends_with"

    new-instance v3, Lfreemarker/core/StringBuiltins$ends_withBI;

    invoke-direct {v3}, Lfreemarker/core/StringBuiltins$ends_withBI;-><init>()V

    invoke-virtual {v1, v2, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 142
    sget-object v1, Lfreemarker/core/BuiltIn;->builtins:Ljava/util/HashMap;

    const-string v2, "eval"

    new-instance v3, Lfreemarker/core/StringBuiltins$evalBI;

    invoke-direct {v3}, Lfreemarker/core/StringBuiltins$evalBI;-><init>()V

    invoke-virtual {v1, v2, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 143
    sget-object v1, Lfreemarker/core/BuiltIn;->builtins:Ljava/util/HashMap;

    const-string v2, "exists"

    new-instance v3, Lfreemarker/core/ExistenceBuiltins$existsBI;

    invoke-direct {v3}, Lfreemarker/core/ExistenceBuiltins$existsBI;-><init>()V

    invoke-virtual {v1, v2, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 144
    sget-object v1, Lfreemarker/core/BuiltIn;->builtins:Ljava/util/HashMap;

    const-string v2, "first"

    new-instance v3, Lfreemarker/core/SequenceBuiltins$firstBI;

    invoke-direct {v3}, Lfreemarker/core/SequenceBuiltins$firstBI;-><init>()V

    invoke-virtual {v1, v2, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 145
    sget-object v1, Lfreemarker/core/BuiltIn;->builtins:Ljava/util/HashMap;

    const-string v2, "float"

    new-instance v3, Lfreemarker/core/NumericalBuiltins$floatBI;

    invoke-direct {v3}, Lfreemarker/core/NumericalBuiltins$floatBI;-><init>()V

    invoke-virtual {v1, v2, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 146
    sget-object v1, Lfreemarker/core/BuiltIn;->builtins:Ljava/util/HashMap;

    const-string v2, "floor"

    new-instance v3, Lfreemarker/core/NumericalBuiltins$floorBI;

    invoke-direct {v3}, Lfreemarker/core/NumericalBuiltins$floorBI;-><init>()V

    invoke-virtual {v1, v2, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 147
    sget-object v1, Lfreemarker/core/BuiltIn;->builtins:Ljava/util/HashMap;

    const-string v2, "chunk"

    new-instance v3, Lfreemarker/core/SequenceBuiltins$chunkBI;

    invoke-direct {v3}, Lfreemarker/core/SequenceBuiltins$chunkBI;-><init>()V

    invoke-virtual {v1, v2, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 148
    sget-object v1, Lfreemarker/core/BuiltIn;->builtins:Ljava/util/HashMap;

    const-string v2, "has_content"

    new-instance v3, Lfreemarker/core/ExistenceBuiltins$has_contentBI;

    invoke-direct {v3}, Lfreemarker/core/ExistenceBuiltins$has_contentBI;-><init>()V

    invoke-virtual {v1, v2, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 149
    sget-object v1, Lfreemarker/core/BuiltIn;->builtins:Ljava/util/HashMap;

    const-string v2, "html"

    new-instance v3, Lfreemarker/core/StringBuiltins$htmlBI;

    invoke-direct {v3}, Lfreemarker/core/StringBuiltins$htmlBI;-><init>()V

    invoke-virtual {v1, v2, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 150
    sget-object v1, Lfreemarker/core/BuiltIn;->builtins:Ljava/util/HashMap;

    const-string v2, "if_exists"

    new-instance v3, Lfreemarker/core/ExistenceBuiltins$if_existsBI;

    invoke-direct {v3}, Lfreemarker/core/ExistenceBuiltins$if_existsBI;-><init>()V

    invoke-virtual {v1, v2, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 151
    sget-object v1, Lfreemarker/core/BuiltIn;->builtins:Ljava/util/HashMap;

    const-string v2, "index_of"

    new-instance v3, Lfreemarker/core/StringBuiltins$index_ofBI;

    invoke-direct {v3, v6}, Lfreemarker/core/StringBuiltins$index_ofBI;-><init>(Z)V

    invoke-virtual {v1, v2, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 152
    sget-object v1, Lfreemarker/core/BuiltIn;->builtins:Ljava/util/HashMap;

    const-string v2, "int"

    new-instance v3, Lfreemarker/core/NumericalBuiltins$intBI;

    invoke-direct {v3}, Lfreemarker/core/NumericalBuiltins$intBI;-><init>()V

    invoke-virtual {v1, v2, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 153
    sget-object v1, Lfreemarker/core/BuiltIn;->builtins:Ljava/util/HashMap;

    const-string v2, "interpret"

    new-instance v3, Lfreemarker/core/Interpret;

    invoke-direct {v3}, Lfreemarker/core/Interpret;-><init>()V

    invoke-virtual {v1, v2, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 154
    sget-object v1, Lfreemarker/core/BuiltIn;->builtins:Ljava/util/HashMap;

    const-string v2, "is_boolean"

    new-instance v3, Lfreemarker/core/MiscellaneousBuiltins$is_booleanBI;

    invoke-direct {v3}, Lfreemarker/core/MiscellaneousBuiltins$is_booleanBI;-><init>()V

    invoke-virtual {v1, v2, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 155
    sget-object v1, Lfreemarker/core/BuiltIn;->builtins:Ljava/util/HashMap;

    const-string v2, "is_collection"

    new-instance v3, Lfreemarker/core/MiscellaneousBuiltins$is_collectionBI;

    invoke-direct {v3}, Lfreemarker/core/MiscellaneousBuiltins$is_collectionBI;-><init>()V

    invoke-virtual {v1, v2, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 156
    sget-object v1, Lfreemarker/core/BuiltIn;->builtins:Ljava/util/HashMap;

    const-string v2, "is_date"

    new-instance v3, Lfreemarker/core/MiscellaneousBuiltins$is_dateBI;

    invoke-direct {v3}, Lfreemarker/core/MiscellaneousBuiltins$is_dateBI;-><init>()V

    invoke-virtual {v1, v2, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 157
    sget-object v1, Lfreemarker/core/BuiltIn;->builtins:Ljava/util/HashMap;

    const-string v2, "is_directive"

    new-instance v3, Lfreemarker/core/MiscellaneousBuiltins$is_directiveBI;

    invoke-direct {v3}, Lfreemarker/core/MiscellaneousBuiltins$is_directiveBI;-><init>()V

    invoke-virtual {v1, v2, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 158
    sget-object v1, Lfreemarker/core/BuiltIn;->builtins:Ljava/util/HashMap;

    const-string v2, "is_enumerable"

    new-instance v3, Lfreemarker/core/MiscellaneousBuiltins$is_enumerableBI;

    invoke-direct {v3}, Lfreemarker/core/MiscellaneousBuiltins$is_enumerableBI;-><init>()V

    invoke-virtual {v1, v2, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 159
    sget-object v1, Lfreemarker/core/BuiltIn;->builtins:Ljava/util/HashMap;

    const-string v2, "is_hash_ex"

    new-instance v3, Lfreemarker/core/MiscellaneousBuiltins$is_hash_exBI;

    invoke-direct {v3}, Lfreemarker/core/MiscellaneousBuiltins$is_hash_exBI;-><init>()V

    invoke-virtual {v1, v2, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 160
    sget-object v1, Lfreemarker/core/BuiltIn;->builtins:Ljava/util/HashMap;

    const-string v2, "is_hash"

    new-instance v3, Lfreemarker/core/MiscellaneousBuiltins$is_hashBI;

    invoke-direct {v3}, Lfreemarker/core/MiscellaneousBuiltins$is_hashBI;-><init>()V

    invoke-virtual {v1, v2, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 161
    sget-object v1, Lfreemarker/core/BuiltIn;->builtins:Ljava/util/HashMap;

    const-string v2, "is_infinite"

    new-instance v3, Lfreemarker/core/NumericalBuiltins$is_infiniteBI;

    invoke-direct {v3}, Lfreemarker/core/NumericalBuiltins$is_infiniteBI;-><init>()V

    invoke-virtual {v1, v2, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 162
    sget-object v1, Lfreemarker/core/BuiltIn;->builtins:Ljava/util/HashMap;

    const-string v2, "is_indexable"

    new-instance v3, Lfreemarker/core/MiscellaneousBuiltins$is_indexableBI;

    invoke-direct {v3}, Lfreemarker/core/MiscellaneousBuiltins$is_indexableBI;-><init>()V

    invoke-virtual {v1, v2, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 163
    sget-object v1, Lfreemarker/core/BuiltIn;->builtins:Ljava/util/HashMap;

    const-string v2, "is_macro"

    new-instance v3, Lfreemarker/core/MiscellaneousBuiltins$is_macroBI;

    invoke-direct {v3}, Lfreemarker/core/MiscellaneousBuiltins$is_macroBI;-><init>()V

    invoke-virtual {v1, v2, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 164
    sget-object v1, Lfreemarker/core/BuiltIn;->builtins:Ljava/util/HashMap;

    const-string v2, "is_method"

    new-instance v3, Lfreemarker/core/MiscellaneousBuiltins$is_methodBI;

    invoke-direct {v3}, Lfreemarker/core/MiscellaneousBuiltins$is_methodBI;-><init>()V

    invoke-virtual {v1, v2, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 165
    sget-object v1, Lfreemarker/core/BuiltIn;->builtins:Ljava/util/HashMap;

    const-string v2, "is_nan"

    new-instance v3, Lfreemarker/core/NumericalBuiltins$is_nanBI;

    invoke-direct {v3}, Lfreemarker/core/NumericalBuiltins$is_nanBI;-><init>()V

    invoke-virtual {v1, v2, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 166
    sget-object v1, Lfreemarker/core/BuiltIn;->builtins:Ljava/util/HashMap;

    const-string v2, "is_node"

    new-instance v3, Lfreemarker/core/MiscellaneousBuiltins$is_nodeBI;

    invoke-direct {v3}, Lfreemarker/core/MiscellaneousBuiltins$is_nodeBI;-><init>()V

    invoke-virtual {v1, v2, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 167
    sget-object v1, Lfreemarker/core/BuiltIn;->builtins:Ljava/util/HashMap;

    const-string v2, "is_number"

    new-instance v3, Lfreemarker/core/MiscellaneousBuiltins$is_numberBI;

    invoke-direct {v3}, Lfreemarker/core/MiscellaneousBuiltins$is_numberBI;-><init>()V

    invoke-virtual {v1, v2, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 168
    sget-object v1, Lfreemarker/core/BuiltIn;->builtins:Ljava/util/HashMap;

    const-string v2, "is_sequence"

    new-instance v3, Lfreemarker/core/MiscellaneousBuiltins$is_sequenceBI;

    invoke-direct {v3}, Lfreemarker/core/MiscellaneousBuiltins$is_sequenceBI;-><init>()V

    invoke-virtual {v1, v2, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 169
    sget-object v1, Lfreemarker/core/BuiltIn;->builtins:Ljava/util/HashMap;

    const-string v2, "is_string"

    new-instance v3, Lfreemarker/core/MiscellaneousBuiltins$is_stringBI;

    invoke-direct {v3}, Lfreemarker/core/MiscellaneousBuiltins$is_stringBI;-><init>()V

    invoke-virtual {v1, v2, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 170
    sget-object v1, Lfreemarker/core/BuiltIn;->builtins:Ljava/util/HashMap;

    const-string v2, "is_transform"

    new-instance v3, Lfreemarker/core/MiscellaneousBuiltins$is_transformBI;

    invoke-direct {v3}, Lfreemarker/core/MiscellaneousBuiltins$is_transformBI;-><init>()V

    invoke-virtual {v1, v2, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 171
    sget-object v1, Lfreemarker/core/BuiltIn;->builtins:Ljava/util/HashMap;

    const-string v2, "iso_utc"

    new-instance v3, Lfreemarker/core/DateBuiltins$iso_tz_BI;

    invoke-direct {v3, v5, v9, v5}, Lfreemarker/core/DateBuiltins$iso_tz_BI;-><init>(ZIZ)V

    invoke-virtual {v1, v2, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 173
    sget-object v1, Lfreemarker/core/BuiltIn;->builtins:Ljava/util/HashMap;

    const-string v2, "iso_utc_nz"

    new-instance v3, Lfreemarker/core/DateBuiltins$iso_tz_BI;

    invoke-direct {v3, v6, v9, v5}, Lfreemarker/core/DateBuiltins$iso_tz_BI;-><init>(ZIZ)V

    invoke-virtual {v1, v2, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 175
    sget-object v1, Lfreemarker/core/BuiltIn;->builtins:Ljava/util/HashMap;

    const-string v2, "iso_utc_ms"

    new-instance v3, Lfreemarker/core/DateBuiltins$iso_tz_BI;

    const/4 v4, 0x7

    invoke-direct {v3, v5, v4, v5}, Lfreemarker/core/DateBuiltins$iso_tz_BI;-><init>(ZIZ)V

    invoke-virtual {v1, v2, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 177
    sget-object v1, Lfreemarker/core/BuiltIn;->builtins:Ljava/util/HashMap;

    const-string v2, "iso_utc_ms_nz"

    new-instance v3, Lfreemarker/core/DateBuiltins$iso_tz_BI;

    const/4 v4, 0x7

    invoke-direct {v3, v6, v4, v5}, Lfreemarker/core/DateBuiltins$iso_tz_BI;-><init>(ZIZ)V

    invoke-virtual {v1, v2, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 179
    sget-object v1, Lfreemarker/core/BuiltIn;->builtins:Ljava/util/HashMap;

    const-string v2, "iso_utc_m"

    new-instance v3, Lfreemarker/core/DateBuiltins$iso_tz_BI;

    invoke-direct {v3, v5, v8, v5}, Lfreemarker/core/DateBuiltins$iso_tz_BI;-><init>(ZIZ)V

    invoke-virtual {v1, v2, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 181
    sget-object v1, Lfreemarker/core/BuiltIn;->builtins:Ljava/util/HashMap;

    const-string v2, "iso_utc_m_nz"

    new-instance v3, Lfreemarker/core/DateBuiltins$iso_tz_BI;

    invoke-direct {v3, v6, v8, v5}, Lfreemarker/core/DateBuiltins$iso_tz_BI;-><init>(ZIZ)V

    invoke-virtual {v1, v2, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 183
    sget-object v1, Lfreemarker/core/BuiltIn;->builtins:Ljava/util/HashMap;

    const-string v2, "iso_utc_h"

    new-instance v3, Lfreemarker/core/DateBuiltins$iso_tz_BI;

    invoke-direct {v3, v5, v7, v5}, Lfreemarker/core/DateBuiltins$iso_tz_BI;-><init>(ZIZ)V

    invoke-virtual {v1, v2, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 185
    sget-object v1, Lfreemarker/core/BuiltIn;->builtins:Ljava/util/HashMap;

    const-string v2, "iso_utc_h_nz"

    new-instance v3, Lfreemarker/core/DateBuiltins$iso_tz_BI;

    invoke-direct {v3, v6, v7, v5}, Lfreemarker/core/DateBuiltins$iso_tz_BI;-><init>(ZIZ)V

    invoke-virtual {v1, v2, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 187
    sget-object v1, Lfreemarker/core/BuiltIn;->builtins:Ljava/util/HashMap;

    const-string v2, "iso_local"

    new-instance v3, Lfreemarker/core/DateBuiltins$iso_tz_BI;

    invoke-direct {v3, v5, v9, v6}, Lfreemarker/core/DateBuiltins$iso_tz_BI;-><init>(ZIZ)V

    invoke-virtual {v1, v2, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 189
    sget-object v1, Lfreemarker/core/BuiltIn;->builtins:Ljava/util/HashMap;

    const-string v2, "iso_local_nz"

    new-instance v3, Lfreemarker/core/DateBuiltins$iso_tz_BI;

    invoke-direct {v3, v6, v9, v6}, Lfreemarker/core/DateBuiltins$iso_tz_BI;-><init>(ZIZ)V

    invoke-virtual {v1, v2, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 191
    sget-object v1, Lfreemarker/core/BuiltIn;->builtins:Ljava/util/HashMap;

    const-string v2, "iso_local_ms"

    new-instance v3, Lfreemarker/core/DateBuiltins$iso_tz_BI;

    const/4 v4, 0x7

    invoke-direct {v3, v5, v4, v6}, Lfreemarker/core/DateBuiltins$iso_tz_BI;-><init>(ZIZ)V

    invoke-virtual {v1, v2, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 193
    sget-object v1, Lfreemarker/core/BuiltIn;->builtins:Ljava/util/HashMap;

    const-string v2, "iso_local_ms_nz"

    new-instance v3, Lfreemarker/core/DateBuiltins$iso_tz_BI;

    const/4 v4, 0x7

    invoke-direct {v3, v6, v4, v6}, Lfreemarker/core/DateBuiltins$iso_tz_BI;-><init>(ZIZ)V

    invoke-virtual {v1, v2, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 195
    sget-object v1, Lfreemarker/core/BuiltIn;->builtins:Ljava/util/HashMap;

    const-string v2, "iso_local_m"

    new-instance v3, Lfreemarker/core/DateBuiltins$iso_tz_BI;

    invoke-direct {v3, v5, v8, v6}, Lfreemarker/core/DateBuiltins$iso_tz_BI;-><init>(ZIZ)V

    invoke-virtual {v1, v2, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 197
    sget-object v1, Lfreemarker/core/BuiltIn;->builtins:Ljava/util/HashMap;

    const-string v2, "iso_local_m_nz"

    new-instance v3, Lfreemarker/core/DateBuiltins$iso_tz_BI;

    invoke-direct {v3, v6, v8, v6}, Lfreemarker/core/DateBuiltins$iso_tz_BI;-><init>(ZIZ)V

    invoke-virtual {v1, v2, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 199
    sget-object v1, Lfreemarker/core/BuiltIn;->builtins:Ljava/util/HashMap;

    const-string v2, "iso_local_h"

    new-instance v3, Lfreemarker/core/DateBuiltins$iso_tz_BI;

    invoke-direct {v3, v5, v7, v6}, Lfreemarker/core/DateBuiltins$iso_tz_BI;-><init>(ZIZ)V

    invoke-virtual {v1, v2, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 201
    sget-object v1, Lfreemarker/core/BuiltIn;->builtins:Ljava/util/HashMap;

    const-string v2, "iso_local_h_nz"

    new-instance v3, Lfreemarker/core/DateBuiltins$iso_tz_BI;

    invoke-direct {v3, v6, v7, v6}, Lfreemarker/core/DateBuiltins$iso_tz_BI;-><init>(ZIZ)V

    invoke-virtual {v1, v2, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 203
    sget-object v1, Lfreemarker/core/BuiltIn;->builtins:Ljava/util/HashMap;

    const-string v2, "iso"

    new-instance v3, Lfreemarker/core/DateBuiltins$iso_BI;

    invoke-direct {v3, v5, v9}, Lfreemarker/core/DateBuiltins$iso_BI;-><init>(ZI)V

    invoke-virtual {v1, v2, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 205
    sget-object v1, Lfreemarker/core/BuiltIn;->builtins:Ljava/util/HashMap;

    const-string v2, "iso_nz"

    new-instance v3, Lfreemarker/core/DateBuiltins$iso_BI;

    invoke-direct {v3, v6, v9}, Lfreemarker/core/DateBuiltins$iso_BI;-><init>(ZI)V

    invoke-virtual {v1, v2, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 207
    sget-object v1, Lfreemarker/core/BuiltIn;->builtins:Ljava/util/HashMap;

    const-string v2, "iso_ms"

    new-instance v3, Lfreemarker/core/DateBuiltins$iso_BI;

    const/4 v4, 0x7

    invoke-direct {v3, v5, v4}, Lfreemarker/core/DateBuiltins$iso_BI;-><init>(ZI)V

    invoke-virtual {v1, v2, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 209
    sget-object v1, Lfreemarker/core/BuiltIn;->builtins:Ljava/util/HashMap;

    const-string v2, "iso_ms_nz"

    new-instance v3, Lfreemarker/core/DateBuiltins$iso_BI;

    const/4 v4, 0x7

    invoke-direct {v3, v6, v4}, Lfreemarker/core/DateBuiltins$iso_BI;-><init>(ZI)V

    invoke-virtual {v1, v2, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 211
    sget-object v1, Lfreemarker/core/BuiltIn;->builtins:Ljava/util/HashMap;

    const-string v2, "iso_m"

    new-instance v3, Lfreemarker/core/DateBuiltins$iso_BI;

    invoke-direct {v3, v5, v8}, Lfreemarker/core/DateBuiltins$iso_BI;-><init>(ZI)V

    invoke-virtual {v1, v2, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 213
    sget-object v1, Lfreemarker/core/BuiltIn;->builtins:Ljava/util/HashMap;

    const-string v2, "iso_m_nz"

    new-instance v3, Lfreemarker/core/DateBuiltins$iso_BI;

    invoke-direct {v3, v6, v8}, Lfreemarker/core/DateBuiltins$iso_BI;-><init>(ZI)V

    invoke-virtual {v1, v2, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 215
    sget-object v1, Lfreemarker/core/BuiltIn;->builtins:Ljava/util/HashMap;

    const-string v2, "iso_h"

    new-instance v3, Lfreemarker/core/DateBuiltins$iso_BI;

    invoke-direct {v3, v5, v7}, Lfreemarker/core/DateBuiltins$iso_BI;-><init>(ZI)V

    invoke-virtual {v1, v2, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 217
    sget-object v1, Lfreemarker/core/BuiltIn;->builtins:Ljava/util/HashMap;

    const-string v2, "iso_h_nz"

    new-instance v3, Lfreemarker/core/DateBuiltins$iso_BI;

    invoke-direct {v3, v6, v7}, Lfreemarker/core/DateBuiltins$iso_BI;-><init>(ZI)V

    invoke-virtual {v1, v2, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 219
    sget-object v1, Lfreemarker/core/BuiltIn;->builtins:Ljava/util/HashMap;

    const-string v2, "j_string"

    new-instance v3, Lfreemarker/core/StringBuiltins$j_stringBI;

    invoke-direct {v3}, Lfreemarker/core/StringBuiltins$j_stringBI;-><init>()V

    invoke-virtual {v1, v2, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 220
    sget-object v1, Lfreemarker/core/BuiltIn;->builtins:Ljava/util/HashMap;

    const-string v2, "join"

    new-instance v3, Lfreemarker/core/SequenceBuiltins$joinBI;

    invoke-direct {v3}, Lfreemarker/core/SequenceBuiltins$joinBI;-><init>()V

    invoke-virtual {v1, v2, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 221
    sget-object v1, Lfreemarker/core/BuiltIn;->builtins:Ljava/util/HashMap;

    const-string v2, "js_string"

    new-instance v3, Lfreemarker/core/StringBuiltins$js_stringBI;

    invoke-direct {v3}, Lfreemarker/core/StringBuiltins$js_stringBI;-><init>()V

    invoke-virtual {v1, v2, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 222
    sget-object v1, Lfreemarker/core/BuiltIn;->builtins:Ljava/util/HashMap;

    const-string v2, "json_string"

    new-instance v3, Lfreemarker/core/StringBuiltins$json_stringBI;

    invoke-direct {v3}, Lfreemarker/core/StringBuiltins$json_stringBI;-><init>()V

    invoke-virtual {v1, v2, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 223
    sget-object v1, Lfreemarker/core/BuiltIn;->builtins:Ljava/util/HashMap;

    const-string v2, "keys"

    new-instance v3, Lfreemarker/core/HashBuiltins$keysBI;

    invoke-direct {v3}, Lfreemarker/core/HashBuiltins$keysBI;-><init>()V

    invoke-virtual {v1, v2, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 224
    sget-object v1, Lfreemarker/core/BuiltIn;->builtins:Ljava/util/HashMap;

    const-string v2, "last_index_of"

    new-instance v3, Lfreemarker/core/StringBuiltins$index_ofBI;

    invoke-direct {v3, v5}, Lfreemarker/core/StringBuiltins$index_ofBI;-><init>(Z)V

    invoke-virtual {v1, v2, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 225
    sget-object v1, Lfreemarker/core/BuiltIn;->builtins:Ljava/util/HashMap;

    const-string v2, "last"

    new-instance v3, Lfreemarker/core/SequenceBuiltins$lastBI;

    invoke-direct {v3}, Lfreemarker/core/SequenceBuiltins$lastBI;-><init>()V

    invoke-virtual {v1, v2, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 226
    sget-object v1, Lfreemarker/core/BuiltIn;->builtins:Ljava/util/HashMap;

    const-string v2, "left_pad"

    new-instance v3, Lfreemarker/core/StringBuiltins$padBI;

    invoke-direct {v3, v5}, Lfreemarker/core/StringBuiltins$padBI;-><init>(Z)V

    invoke-virtual {v1, v2, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 227
    sget-object v1, Lfreemarker/core/BuiltIn;->builtins:Ljava/util/HashMap;

    const-string v2, "length"

    new-instance v3, Lfreemarker/core/StringBuiltins$lengthBI;

    invoke-direct {v3}, Lfreemarker/core/StringBuiltins$lengthBI;-><init>()V

    invoke-virtual {v1, v2, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 228
    sget-object v1, Lfreemarker/core/BuiltIn;->builtins:Ljava/util/HashMap;

    const-string v2, "long"

    new-instance v3, Lfreemarker/core/NumericalBuiltins$longBI;

    invoke-direct {v3}, Lfreemarker/core/NumericalBuiltins$longBI;-><init>()V

    invoke-virtual {v1, v2, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 229
    sget-object v1, Lfreemarker/core/BuiltIn;->builtins:Ljava/util/HashMap;

    const-string v2, "lower_case"

    new-instance v3, Lfreemarker/core/StringBuiltins$lower_caseBI;

    invoke-direct {v3}, Lfreemarker/core/StringBuiltins$lower_caseBI;-><init>()V

    invoke-virtual {v1, v2, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 230
    sget-object v1, Lfreemarker/core/BuiltIn;->builtins:Ljava/util/HashMap;

    const-string v2, "namespace"

    new-instance v3, Lfreemarker/core/MiscellaneousBuiltins$namespaceBI;

    invoke-direct {v3}, Lfreemarker/core/MiscellaneousBuiltins$namespaceBI;-><init>()V

    invoke-virtual {v1, v2, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 231
    sget-object v1, Lfreemarker/core/BuiltIn;->builtins:Ljava/util/HashMap;

    const-string v2, "new"

    new-instance v3, Lfreemarker/core/NewBI;

    invoke-direct {v3}, Lfreemarker/core/NewBI;-><init>()V

    invoke-virtual {v1, v2, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 232
    sget-object v1, Lfreemarker/core/BuiltIn;->builtins:Ljava/util/HashMap;

    const-string v2, "node_name"

    new-instance v3, Lfreemarker/core/NodeBuiltins$node_nameBI;

    invoke-direct {v3}, Lfreemarker/core/NodeBuiltins$node_nameBI;-><init>()V

    invoke-virtual {v1, v2, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 233
    sget-object v1, Lfreemarker/core/BuiltIn;->builtins:Ljava/util/HashMap;

    const-string v2, "node_namespace"

    new-instance v3, Lfreemarker/core/NodeBuiltins$node_namespaceBI;

    invoke-direct {v3}, Lfreemarker/core/NodeBuiltins$node_namespaceBI;-><init>()V

    invoke-virtual {v1, v2, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 234
    sget-object v1, Lfreemarker/core/BuiltIn;->builtins:Ljava/util/HashMap;

    const-string v2, "node_type"

    new-instance v3, Lfreemarker/core/NodeBuiltins$node_typeBI;

    invoke-direct {v3}, Lfreemarker/core/NodeBuiltins$node_typeBI;-><init>()V

    invoke-virtual {v1, v2, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 235
    sget-object v1, Lfreemarker/core/BuiltIn;->builtins:Ljava/util/HashMap;

    const-string v2, "number"

    new-instance v3, Lfreemarker/core/StringBuiltins$numberBI;

    invoke-direct {v3}, Lfreemarker/core/StringBuiltins$numberBI;-><init>()V

    invoke-virtual {v1, v2, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 236
    sget-object v1, Lfreemarker/core/BuiltIn;->builtins:Ljava/util/HashMap;

    const-string v2, "number_to_date"

    new-instance v3, Lfreemarker/core/NumericalBuiltins$number_to_dateBI;

    const/4 v4, 0x2

    invoke-direct {v3, v4}, Lfreemarker/core/NumericalBuiltins$number_to_dateBI;-><init>(I)V

    invoke-virtual {v1, v2, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 237
    sget-object v1, Lfreemarker/core/BuiltIn;->builtins:Ljava/util/HashMap;

    const-string v2, "number_to_time"

    new-instance v3, Lfreemarker/core/NumericalBuiltins$number_to_dateBI;

    invoke-direct {v3, v5}, Lfreemarker/core/NumericalBuiltins$number_to_dateBI;-><init>(I)V

    invoke-virtual {v1, v2, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 238
    sget-object v1, Lfreemarker/core/BuiltIn;->builtins:Ljava/util/HashMap;

    const-string v2, "number_to_datetime"

    new-instance v3, Lfreemarker/core/NumericalBuiltins$number_to_dateBI;

    const/4 v4, 0x3

    invoke-direct {v3, v4}, Lfreemarker/core/NumericalBuiltins$number_to_dateBI;-><init>(I)V

    invoke-virtual {v1, v2, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 239
    sget-object v1, Lfreemarker/core/BuiltIn;->builtins:Ljava/util/HashMap;

    const-string v2, "parent"

    new-instance v3, Lfreemarker/core/NodeBuiltins$parentBI;

    invoke-direct {v3}, Lfreemarker/core/NodeBuiltins$parentBI;-><init>()V

    invoke-virtual {v1, v2, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 240
    sget-object v1, Lfreemarker/core/BuiltIn;->builtins:Ljava/util/HashMap;

    const-string v2, "replace"

    new-instance v3, Lfreemarker/core/StringBuiltins$replaceBI;

    invoke-direct {v3}, Lfreemarker/core/StringBuiltins$replaceBI;-><init>()V

    invoke-virtual {v1, v2, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 241
    sget-object v1, Lfreemarker/core/BuiltIn;->builtins:Ljava/util/HashMap;

    const-string v2, "reverse"

    new-instance v3, Lfreemarker/core/SequenceBuiltins$reverseBI;

    invoke-direct {v3}, Lfreemarker/core/SequenceBuiltins$reverseBI;-><init>()V

    invoke-virtual {v1, v2, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 242
    sget-object v1, Lfreemarker/core/BuiltIn;->builtins:Ljava/util/HashMap;

    const-string v2, "right_pad"

    new-instance v3, Lfreemarker/core/StringBuiltins$padBI;

    invoke-direct {v3, v6}, Lfreemarker/core/StringBuiltins$padBI;-><init>(Z)V

    invoke-virtual {v1, v2, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 243
    sget-object v1, Lfreemarker/core/BuiltIn;->builtins:Ljava/util/HashMap;

    const-string v2, "root"

    new-instance v3, Lfreemarker/core/NodeBuiltins$rootBI;

    invoke-direct {v3}, Lfreemarker/core/NodeBuiltins$rootBI;-><init>()V

    invoke-virtual {v1, v2, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 244
    sget-object v1, Lfreemarker/core/BuiltIn;->builtins:Ljava/util/HashMap;

    const-string v2, "round"

    new-instance v3, Lfreemarker/core/NumericalBuiltins$roundBI;

    invoke-direct {v3}, Lfreemarker/core/NumericalBuiltins$roundBI;-><init>()V

    invoke-virtual {v1, v2, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 245
    sget-object v1, Lfreemarker/core/BuiltIn;->builtins:Ljava/util/HashMap;

    const-string v2, "rtf"

    new-instance v3, Lfreemarker/core/StringBuiltins$rtfBI;

    invoke-direct {v3}, Lfreemarker/core/StringBuiltins$rtfBI;-><init>()V

    invoke-virtual {v1, v2, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 246
    sget-object v1, Lfreemarker/core/BuiltIn;->builtins:Ljava/util/HashMap;

    const-string v2, "seq_contains"

    new-instance v3, Lfreemarker/core/SequenceBuiltins$seq_containsBI;

    invoke-direct {v3}, Lfreemarker/core/SequenceBuiltins$seq_containsBI;-><init>()V

    invoke-virtual {v1, v2, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 247
    sget-object v1, Lfreemarker/core/BuiltIn;->builtins:Ljava/util/HashMap;

    const-string v2, "seq_index_of"

    new-instance v3, Lfreemarker/core/SequenceBuiltins$seq_index_ofBI;

    invoke-direct {v3, v5}, Lfreemarker/core/SequenceBuiltins$seq_index_ofBI;-><init>(I)V

    invoke-virtual {v1, v2, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 248
    sget-object v1, Lfreemarker/core/BuiltIn;->builtins:Ljava/util/HashMap;

    const-string v2, "seq_last_index_of"

    new-instance v3, Lfreemarker/core/SequenceBuiltins$seq_index_ofBI;

    const/4 v4, -0x1

    invoke-direct {v3, v4}, Lfreemarker/core/SequenceBuiltins$seq_index_ofBI;-><init>(I)V

    invoke-virtual {v1, v2, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 249
    sget-object v1, Lfreemarker/core/BuiltIn;->builtins:Ljava/util/HashMap;

    const-string v2, "short"

    new-instance v3, Lfreemarker/core/NumericalBuiltins$shortBI;

    invoke-direct {v3}, Lfreemarker/core/NumericalBuiltins$shortBI;-><init>()V

    invoke-virtual {v1, v2, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 250
    sget-object v1, Lfreemarker/core/BuiltIn;->builtins:Ljava/util/HashMap;

    const-string v2, "size"

    new-instance v3, Lfreemarker/core/MiscellaneousBuiltins$sizeBI;

    invoke-direct {v3}, Lfreemarker/core/MiscellaneousBuiltins$sizeBI;-><init>()V

    invoke-virtual {v1, v2, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 251
    sget-object v1, Lfreemarker/core/BuiltIn;->builtins:Ljava/util/HashMap;

    const-string v2, "sort_by"

    new-instance v3, Lfreemarker/core/SequenceBuiltins$sort_byBI;

    invoke-direct {v3}, Lfreemarker/core/SequenceBuiltins$sort_byBI;-><init>()V

    invoke-virtual {v1, v2, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 252
    sget-object v1, Lfreemarker/core/BuiltIn;->builtins:Ljava/util/HashMap;

    const-string v2, "sort"

    new-instance v3, Lfreemarker/core/SequenceBuiltins$sortBI;

    invoke-direct {v3}, Lfreemarker/core/SequenceBuiltins$sortBI;-><init>()V

    invoke-virtual {v1, v2, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 253
    sget-object v1, Lfreemarker/core/BuiltIn;->builtins:Ljava/util/HashMap;

    const-string v2, "split"

    new-instance v3, Lfreemarker/core/StringBuiltins$splitBI;

    invoke-direct {v3}, Lfreemarker/core/StringBuiltins$splitBI;-><init>()V

    invoke-virtual {v1, v2, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 254
    sget-object v1, Lfreemarker/core/BuiltIn;->builtins:Ljava/util/HashMap;

    const-string v2, "starts_with"

    new-instance v3, Lfreemarker/core/StringBuiltins$starts_withBI;

    invoke-direct {v3}, Lfreemarker/core/StringBuiltins$starts_withBI;-><init>()V

    invoke-virtual {v1, v2, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 255
    sget-object v1, Lfreemarker/core/BuiltIn;->builtins:Ljava/util/HashMap;

    const-string v2, "string"

    new-instance v3, Lfreemarker/core/MiscellaneousBuiltins$stringBI;

    invoke-direct {v3}, Lfreemarker/core/MiscellaneousBuiltins$stringBI;-><init>()V

    invoke-virtual {v1, v2, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 256
    sget-object v1, Lfreemarker/core/BuiltIn;->builtins:Ljava/util/HashMap;

    const-string v2, "substring"

    new-instance v3, Lfreemarker/core/StringBuiltins$substringBI;

    invoke-direct {v3}, Lfreemarker/core/StringBuiltins$substringBI;-><init>()V

    invoke-virtual {v1, v2, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 257
    sget-object v1, Lfreemarker/core/BuiltIn;->builtins:Ljava/util/HashMap;

    const-string v2, "time"

    new-instance v3, Lfreemarker/core/MiscellaneousBuiltins$dateBI;

    invoke-direct {v3, v5}, Lfreemarker/core/MiscellaneousBuiltins$dateBI;-><init>(I)V

    invoke-virtual {v1, v2, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 258
    sget-object v1, Lfreemarker/core/BuiltIn;->builtins:Ljava/util/HashMap;

    const-string v2, "trim"

    new-instance v3, Lfreemarker/core/StringBuiltins$trimBI;

    invoke-direct {v3}, Lfreemarker/core/StringBuiltins$trimBI;-><init>()V

    invoke-virtual {v1, v2, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 259
    sget-object v1, Lfreemarker/core/BuiltIn;->builtins:Ljava/util/HashMap;

    const-string v2, "uncap_first"

    new-instance v3, Lfreemarker/core/StringBuiltins$uncap_firstBI;

    invoke-direct {v3}, Lfreemarker/core/StringBuiltins$uncap_firstBI;-><init>()V

    invoke-virtual {v1, v2, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 260
    sget-object v1, Lfreemarker/core/BuiltIn;->builtins:Ljava/util/HashMap;

    const-string v2, "upper_case"

    new-instance v3, Lfreemarker/core/StringBuiltins$upper_caseBI;

    invoke-direct {v3}, Lfreemarker/core/StringBuiltins$upper_caseBI;-><init>()V

    invoke-virtual {v1, v2, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 261
    sget-object v1, Lfreemarker/core/BuiltIn;->builtins:Ljava/util/HashMap;

    const-string v2, "url"

    new-instance v3, Lfreemarker/core/StringBuiltins$urlBI;

    invoke-direct {v3}, Lfreemarker/core/StringBuiltins$urlBI;-><init>()V

    invoke-virtual {v1, v2, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 262
    sget-object v1, Lfreemarker/core/BuiltIn;->builtins:Ljava/util/HashMap;

    const-string v2, "values"

    new-instance v3, Lfreemarker/core/HashBuiltins$valuesBI;

    invoke-direct {v3}, Lfreemarker/core/HashBuiltins$valuesBI;-><init>()V

    invoke-virtual {v1, v2, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 263
    sget-object v1, Lfreemarker/core/BuiltIn;->builtins:Ljava/util/HashMap;

    const-string v2, "web_safe"

    sget-object v3, Lfreemarker/core/BuiltIn;->builtins:Ljava/util/HashMap;

    const-string v4, "html"

    invoke-virtual {v3, v4}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 264
    sget-object v1, Lfreemarker/core/BuiltIn;->builtins:Ljava/util/HashMap;

    const-string v2, "word_list"

    new-instance v3, Lfreemarker/core/StringBuiltins$word_listBI;

    invoke-direct {v3}, Lfreemarker/core/StringBuiltins$word_listBI;-><init>()V

    invoke-virtual {v1, v2, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 265
    sget-object v1, Lfreemarker/core/BuiltIn;->builtins:Ljava/util/HashMap;

    const-string v2, "xhtml"

    new-instance v3, Lfreemarker/core/StringBuiltins$xhtmlBI;

    invoke-direct {v3}, Lfreemarker/core/StringBuiltins$xhtmlBI;-><init>()V

    invoke-virtual {v1, v2, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 266
    sget-object v1, Lfreemarker/core/BuiltIn;->builtins:Ljava/util/HashMap;

    const-string v2, "xml"

    new-instance v3, Lfreemarker/core/StringBuiltins$xmlBI;

    invoke-direct {v3}, Lfreemarker/core/StringBuiltins$xmlBI;-><init>()V

    invoke-virtual {v1, v2, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 268
    :try_start_592
    const-string v1, "java.util.regex.Pattern"

    invoke-static {v1}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    .line 269
    sget-object v1, Lfreemarker/core/BuiltIn;->builtins:Ljava/util/HashMap;

    const-string v2, "matches"

    const-string v3, "freemarker.core._RegexBuiltins$matchesBI"

    invoke-static {v3}, Lfreemarker/core/BuiltIn;->instantiateBI(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 270
    sget-object v1, Lfreemarker/core/BuiltIn;->builtins:Ljava/util/HashMap;

    const-string v2, "groups"

    const-string v3, "freemarker.core._RegexBuiltins$groupsBI"

    invoke-static {v3}, Lfreemarker/core/BuiltIn;->instantiateBI(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 271
    sget-object v1, Lfreemarker/core/BuiltIn;->builtins:Ljava/util/HashMap;

    const-string v2, "replace"

    const-string v3, "freemarker.core._RegexBuiltins$replace_reBI"

    invoke-static {v3}, Lfreemarker/core/BuiltIn;->instantiateBI(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 272
    sget-object v1, Lfreemarker/core/BuiltIn;->builtins:Ljava/util/HashMap;

    const-string v2, "split"

    const-string v3, "freemarker.core._RegexBuiltins$split_reBI"

    invoke-static {v3}, Lfreemarker/core/BuiltIn;->instantiateBI(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_5cb
    .catch Ljava/lang/Exception; {:try_start_592 .. :try_end_5cb} :catch_5cc

    .line 276
    .local v0, "e":Ljava/lang/Exception;
    :goto_5cb
    return-void

    .line 273
    .end local v0    # "e":Ljava/lang/Exception;
    :catch_5cc
    move-exception v0

    .line 274
    .restart local v0    # "e":Ljava/lang/Exception;
    sget-object v1, Lfreemarker/core/BuiltIn;->logger:Lfreemarker/log/Logger;

    const-string v2, "Regular expression built-ins won\'t be avilable"

    invoke-virtual {v1, v2, v0}, Lfreemarker/log/Logger;->debug(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_5cb
.end method

.method constructor <init>()V
    .registers 1

    .prologue
    .line 118
    invoke-direct {p0}, Lfreemarker/core/Expression;-><init>()V

    return-void
.end method

.method private static instantiateBI(Ljava/lang/String;)Ljava/lang/Object;
    .registers 2
    .param p0, "className"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 280
    invoke-static {p0}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Class;->newInstance()Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method static newBuiltIn(ILfreemarker/core/Expression;Ljava/lang/String;)Lfreemarker/core/BuiltIn;
    .registers 13
    .param p0, "incompatibleImprovements"    # I
    .param p1, "target"    # Lfreemarker/core/Expression;
    .param p2, "key"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lfreemarker/core/ParseException;
        }
    .end annotation

    .prologue
    .line 284
    sget-object v8, Lfreemarker/core/BuiltIn;->builtins:Ljava/util/HashMap;

    invoke-virtual {v8, p2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lfreemarker/core/BuiltIn;

    .line 285
    .local v0, "bi":Lfreemarker/core/BuiltIn;
    if-nez v0, :cond_9e

    .line 286
    new-instance v1, Ljava/lang/StringBuffer;

    new-instance v8, Ljava/lang/StringBuffer;

    invoke-direct {v8}, Ljava/lang/StringBuffer;-><init>()V

    const-string v9, "Unknown built-in: "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v8

    invoke-static {p2}, Lfreemarker/template/utility/StringUtil;->jQuote(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v8

    const-string v9, ". "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v8

    const-string v9, "Help (latest version): http://freemarker.org/docs/ref_builtins.html; "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v8

    const-string v9, "you\'re using FreeMarker "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v8

    invoke-static {}, Lfreemarker/template/Configuration;->getVersion()Lfreemarker/template/Version;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v8

    const-string v9, ".\n"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v8

    const-string v9, "The alphabetical list of built-ins:"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-direct {v1, v8}, Ljava/lang/StringBuffer;-><init>(Ljava/lang/String;)V

    .line 291
    .local v1, "buf":Ljava/lang/StringBuffer;
    new-instance v7, Ljava/util/ArrayList;

    sget-object v8, Lfreemarker/core/BuiltIn;->builtins:Ljava/util/HashMap;

    invoke-virtual {v8}, Ljava/util/HashMap;->keySet()Ljava/util/Set;

    move-result-object v8

    invoke-interface {v8}, Ljava/util/Set;->size()I

    move-result v8

    invoke-direct {v7, v8}, Ljava/util/ArrayList;-><init>(I)V

    .line 292
    .local v7, "names":Ljava/util/List;
    sget-object v8, Lfreemarker/core/BuiltIn;->builtins:Ljava/util/HashMap;

    invoke-virtual {v8}, Ljava/util/HashMap;->keySet()Ljava/util/Set;

    move-result-object v8

    invoke-interface {v7, v8}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 293
    invoke-static {v7}, Ljava/util/Collections;->sort(Ljava/util/List;)V

    .line 294
    const/4 v5, 0x0

    .line 295
    .local v5, "lastLetter":C
    invoke-interface {v7}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v4

    .local v4, "it":Ljava/util/Iterator;
    :cond_6c
    :goto_6c
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v8

    if-eqz v8, :cond_94

    .line 296
    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/lang/String;

    .line 297
    .local v6, "name":Ljava/lang/String;
    const/4 v8, 0x0

    invoke-virtual {v6, v8}, Ljava/lang/String;->charAt(I)C

    move-result v3

    .line 298
    .local v3, "firstChar":C
    if-eq v3, v5, :cond_85

    .line 299
    move v5, v3

    .line 300
    const/16 v8, 0xa

    invoke-virtual {v1, v8}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 302
    :cond_85
    invoke-virtual {v1, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 304
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v8

    if-eqz v8, :cond_6c

    .line 305
    const-string v8, ", "

    invoke-virtual {v1, v8}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    goto :goto_6c

    .line 308
    .end local v3    # "firstChar":C
    .end local v6    # "name":Ljava/lang/String;
    :cond_94
    new-instance v8, Lfreemarker/core/ParseException;

    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-direct {v8, v9, p1}, Lfreemarker/core/ParseException;-><init>(Ljava/lang/String;Lfreemarker/core/TemplateObject;)V

    throw v8

    .line 312
    .end local v1    # "buf":Ljava/lang/StringBuffer;
    .end local v4    # "it":Ljava/util/Iterator;
    .end local v5    # "lastLetter":C
    .end local v7    # "names":Ljava/util/List;
    :cond_9e
    :goto_9e
    instance-of v8, v0, Lfreemarker/core/ICIChainMember;

    if-eqz v8, :cond_b4

    move-object v8, v0

    check-cast v8, Lfreemarker/core/ICIChainMember;

    invoke-interface {v8}, Lfreemarker/core/ICIChainMember;->getMinimumICIVersion()I

    move-result v8

    if-ge p0, v8, :cond_b4

    .line 313
    check-cast v0, Lfreemarker/core/ICIChainMember;

    .end local v0    # "bi":Lfreemarker/core/BuiltIn;
    invoke-interface {v0}, Lfreemarker/core/ICIChainMember;->getPreviousICIChainMember()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lfreemarker/core/BuiltIn;

    .restart local v0    # "bi":Lfreemarker/core/BuiltIn;
    goto :goto_9e

    .line 317
    :cond_b4
    :try_start_b4
    invoke-virtual {v0}, Ljava/lang/Object;->clone()Ljava/lang/Object;

    move-result-object v0

    .end local v0    # "bi":Lfreemarker/core/BuiltIn;
    check-cast v0, Lfreemarker/core/BuiltIn;
    :try_end_ba
    .catch Ljava/lang/CloneNotSupportedException; {:try_start_b4 .. :try_end_ba} :catch_bf

    .line 322
    .restart local v0    # "bi":Lfreemarker/core/BuiltIn;
    iput-object p1, v0, Lfreemarker/core/BuiltIn;->target:Lfreemarker/core/Expression;

    .line 323
    iput-object p2, v0, Lfreemarker/core/BuiltIn;->key:Ljava/lang/String;

    .line 324
    return-object v0

    .line 319
    .end local v0    # "bi":Lfreemarker/core/BuiltIn;
    :catch_bf
    move-exception v2

    .line 320
    .local v2, "e":Ljava/lang/CloneNotSupportedException;
    new-instance v8, Ljava/lang/InternalError;

    invoke-direct {v8}, Ljava/lang/InternalError;-><init>()V

    throw v8
.end method


# virtual methods
.method protected final checkMethodArgCount(II)V
    .registers 5
    .param p1, "argCnt"    # I
    .param p2, "expectedCnt"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lfreemarker/template/TemplateModelException;
        }
    .end annotation

    .prologue
    .line 344
    if-eq p1, p2, :cond_1c

    .line 345
    new-instance v0, Ljava/lang/StringBuffer;

    invoke-direct {v0}, Ljava/lang/StringBuffer;-><init>()V

    const-string v1, "?"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v0

    iget-object v1, p0, Lfreemarker/core/BuiltIn;->key:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0, p1, p2}, Lfreemarker/core/MessageUtil;->newArgCntError(Ljava/lang/String;II)Lfreemarker/template/TemplateModelException;

    move-result-object v0

    throw v0

    .line 347
    :cond_1c
    return-void
.end method

.method protected final checkMethodArgCount(III)V
    .registers 6
    .param p1, "argCnt"    # I
    .param p2, "minCnt"    # I
    .param p3, "maxCnt"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lfreemarker/template/TemplateModelException;
        }
    .end annotation

    .prologue
    .line 354
    if-lt p1, p2, :cond_4

    if-le p1, p3, :cond_1e

    .line 355
    :cond_4
    new-instance v0, Ljava/lang/StringBuffer;

    invoke-direct {v0}, Ljava/lang/StringBuffer;-><init>()V

    const-string v1, "?"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v0

    iget-object v1, p0, Lfreemarker/core/BuiltIn;->key:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0, p1, p2, p3}, Lfreemarker/core/MessageUtil;->newArgCntError(Ljava/lang/String;III)Lfreemarker/template/TemplateModelException;

    move-result-object v0

    throw v0

    .line 357
    :cond_1e
    return-void
.end method

.method protected final checkMethodArgCount(Ljava/util/List;I)V
    .registers 4
    .param p1, "args"    # Ljava/util/List;
    .param p2, "expectedCnt"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lfreemarker/template/TemplateModelException;
        }
    .end annotation

    .prologue
    .line 340
    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v0

    invoke-virtual {p0, v0, p2}, Lfreemarker/core/BuiltIn;->checkMethodArgCount(II)V

    .line 341
    return-void
.end method

.method protected final checkMethodArgCount(Ljava/util/List;II)V
    .registers 5
    .param p1, "args"    # Ljava/util/List;
    .param p2, "minCnt"    # I
    .param p3, "maxCnt"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lfreemarker/template/TemplateModelException;
        }
    .end annotation

    .prologue
    .line 350
    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v0

    invoke-virtual {p0, v0, p2, p3}, Lfreemarker/core/BuiltIn;->checkMethodArgCount(III)V

    .line 351
    return-void
.end method

.method protected final deepCloneWithIdentifierReplaced_inner(Ljava/lang/String;Lfreemarker/core/Expression;Lfreemarker/core/Expression$ReplacemenetState;)Lfreemarker/core/Expression;
    .registers 9
    .param p1, "replacedIdentifier"    # Ljava/lang/String;
    .param p2, "replacement"    # Lfreemarker/core/Expression;
    .param p3, "replacementState"    # Lfreemarker/core/Expression$ReplacemenetState;

    .prologue
    .line 397
    :try_start_0
    invoke-virtual {p0}, Ljava/lang/Object;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lfreemarker/core/BuiltIn;

    .line 398
    .local v0, "clone":Lfreemarker/core/BuiltIn;
    iget-object v2, p0, Lfreemarker/core/BuiltIn;->target:Lfreemarker/core/Expression;

    invoke-virtual {v2, p1, p2, p3}, Lfreemarker/core/Expression;->deepCloneWithIdentifierReplaced(Ljava/lang/String;Lfreemarker/core/Expression;Lfreemarker/core/Expression$ReplacemenetState;)Lfreemarker/core/Expression;

    move-result-object v2

    iput-object v2, v0, Lfreemarker/core/BuiltIn;->target:Lfreemarker/core/Expression;
    :try_end_e
    .catch Ljava/lang/CloneNotSupportedException; {:try_start_0 .. :try_end_e} :catch_f

    .line 399
    return-object v0

    .line 401
    .end local v0    # "clone":Lfreemarker/core/BuiltIn;
    :catch_f
    move-exception v1

    .line 402
    .local v1, "e":Ljava/lang/CloneNotSupportedException;
    new-instance v2, Ljava/lang/RuntimeException;

    new-instance v3, Ljava/lang/StringBuffer;

    invoke-direct {v3}, Ljava/lang/StringBuffer;-><init>()V

    const-string v4, "Internal error: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v3, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v2
.end method

.method public getCanonicalForm()Ljava/lang/String;
    .registers 3

    .prologue
    .line 328
    new-instance v0, Ljava/lang/StringBuffer;

    invoke-direct {v0}, Ljava/lang/StringBuffer;-><init>()V

    iget-object v1, p0, Lfreemarker/core/BuiltIn;->target:Lfreemarker/core/Expression;

    invoke-virtual {v1}, Lfreemarker/core/Expression;->getCanonicalForm()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v0

    invoke-virtual {p0}, Lfreemarker/core/BuiltIn;->getNodeTypeSymbol()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method getNodeTypeSymbol()Ljava/lang/String;
    .registers 3

    .prologue
    .line 332
    new-instance v0, Ljava/lang/StringBuffer;

    invoke-direct {v0}, Ljava/lang/StringBuffer;-><init>()V

    const-string v1, "?"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v0

    iget-object v1, p0, Lfreemarker/core/BuiltIn;->key:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method protected final getNumberMethodArg(Ljava/util/List;I)Ljava/lang/Number;
    .registers 6
    .param p1, "args"    # Ljava/util/List;
    .param p2, "argIdx"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lfreemarker/template/TemplateModelException;
        }
    .end annotation

    .prologue
    .line 386
    invoke-interface {p1, p2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lfreemarker/template/TemplateModel;

    .line 387
    .local v0, "arg":Lfreemarker/template/TemplateModel;
    instance-of v1, v0, Lfreemarker/template/TemplateNumberModel;

    if-nez v1, :cond_24

    .line 388
    new-instance v1, Ljava/lang/StringBuffer;

    invoke-direct {v1}, Ljava/lang/StringBuffer;-><init>()V

    const-string v2, "?"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    iget-object v2, p0, Lfreemarker/core/BuiltIn;->key:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1, p2, v0}, Lfreemarker/core/MessageUtil;->newMethodArgMustBeNumberException(Ljava/lang/String;ILfreemarker/template/TemplateModel;)Lfreemarker/template/TemplateModelException;

    move-result-object v1

    throw v1

    .line 390
    :cond_24
    check-cast v0, Lfreemarker/template/TemplateNumberModel;

    .end local v0    # "arg":Lfreemarker/template/TemplateModel;
    const/4 v1, 0x0

    invoke-static {v0, v1}, Lfreemarker/core/EvalUtil;->modelToNumber(Lfreemarker/template/TemplateNumberModel;Lfreemarker/core/Expression;)Ljava/lang/Number;

    move-result-object v1

    return-object v1
.end method

.method protected final getOptStringMethodArg(Ljava/util/List;I)Ljava/lang/String;
    .registers 4
    .param p1, "args"    # Ljava/util/List;
    .param p2, "argIdx"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lfreemarker/template/TemplateModelException;
        }
    .end annotation

    .prologue
    .line 365
    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v0

    if-le v0, p2, :cond_b

    invoke-virtual {p0, p1, p2}, Lfreemarker/core/BuiltIn;->getStringMethodArg(Ljava/util/List;I)Ljava/lang/String;

    move-result-object v0

    :goto_a
    return-object v0

    :cond_b
    const/4 v0, 0x0

    goto :goto_a
.end method

.method getParameterCount()I
    .registers 2

    .prologue
    .line 407
    const/4 v0, 0x2

    return v0
.end method

.method getParameterRole(I)Lfreemarker/core/ParameterRole;
    .registers 3
    .param p1, "idx"    # I

    .prologue
    .line 419
    packed-switch p1, :pswitch_data_10

    .line 422
    new-instance v0, Ljava/lang/IndexOutOfBoundsException;

    invoke-direct {v0}, Ljava/lang/IndexOutOfBoundsException;-><init>()V

    throw v0

    .line 420
    :pswitch_9
    sget-object v0, Lfreemarker/core/ParameterRole;->LEFT_HAND_OPERAND:Lfreemarker/core/ParameterRole;

    .line 421
    :goto_b
    return-object v0

    :pswitch_c
    sget-object v0, Lfreemarker/core/ParameterRole;->RIGHT_HAND_OPERAND:Lfreemarker/core/ParameterRole;

    goto :goto_b

    .line 419
    nop

    :pswitch_data_10
    .packed-switch 0x0
        :pswitch_9
        :pswitch_c
    .end packed-switch
.end method

.method getParameterValue(I)Ljava/lang/Object;
    .registers 3
    .param p1, "idx"    # I

    .prologue
    .line 411
    packed-switch p1, :pswitch_data_10

    .line 414
    new-instance v0, Ljava/lang/IndexOutOfBoundsException;

    invoke-direct {v0}, Ljava/lang/IndexOutOfBoundsException;-><init>()V

    throw v0

    .line 412
    :pswitch_9
    iget-object v0, p0, Lfreemarker/core/BuiltIn;->target:Lfreemarker/core/Expression;

    .line 413
    :goto_b
    return-object v0

    :pswitch_c
    iget-object v0, p0, Lfreemarker/core/BuiltIn;->key:Ljava/lang/String;

    goto :goto_b

    .line 411
    nop

    :pswitch_data_10
    .packed-switch 0x0
        :pswitch_9
        :pswitch_c
    .end packed-switch
.end method

.method protected final getStringMethodArg(Ljava/util/List;I)Ljava/lang/String;
    .registers 6
    .param p1, "args"    # Ljava/util/List;
    .param p2, "argIdx"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lfreemarker/template/TemplateModelException;
        }
    .end annotation

    .prologue
    const/4 v2, 0x0

    .line 373
    invoke-interface {p1, p2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lfreemarker/template/TemplateModel;

    .line 374
    .local v0, "arg":Lfreemarker/template/TemplateModel;
    instance-of v1, v0, Lfreemarker/template/TemplateScalarModel;

    if-nez v1, :cond_25

    .line 375
    new-instance v1, Ljava/lang/StringBuffer;

    invoke-direct {v1}, Ljava/lang/StringBuffer;-><init>()V

    const-string v2, "?"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    iget-object v2, p0, Lfreemarker/core/BuiltIn;->key:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1, p2, v0}, Lfreemarker/core/MessageUtil;->newMethodArgMustBeStringException(Ljava/lang/String;ILfreemarker/template/TemplateModel;)Lfreemarker/template/TemplateModelException;

    move-result-object v1

    throw v1

    .line 377
    :cond_25
    check-cast v0, Lfreemarker/template/TemplateScalarModel;

    .end local v0    # "arg":Lfreemarker/template/TemplateModel;
    invoke-static {v0, v2, v2}, Lfreemarker/core/EvalUtil;->modelToString(Lfreemarker/template/TemplateScalarModel;Lfreemarker/core/Expression;Lfreemarker/core/Environment;)Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method isLiteral()Z
    .registers 2

    .prologue
    .line 336
    const/4 v0, 0x0

    return v0
.end method
