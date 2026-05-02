package com.google.gson;

import java.io.IOException;
import java.util.Iterator;
import java.util.Map;

/* loaded from: gson-1.7.2.jar:com/google/gson/JsonTreeNavigator.class */
final class JsonTreeNavigator {
    private final JsonElementVisitor visitor;
    private final boolean visitNulls;

    JsonTreeNavigator(JsonElementVisitor visitor, boolean visitNulls) {
        this.visitor = visitor;
        this.visitNulls = visitNulls;
    }

    public void navigate(JsonElement element) throws IOException {
        if (element.isJsonNull()) {
            this.visitor.visitNull();
            return;
        }
        if (element.isJsonArray()) {
            JsonArray array = element.getAsJsonArray();
            this.visitor.startArray(array);
            boolean isFirst = true;
            Iterator i$ = array.iterator();
            while (i$.hasNext()) {
                JsonElement child = i$.next();
                visitChild(array, child, isFirst);
                if (isFirst) {
                    isFirst = false;
                }
            }
            this.visitor.endArray(array);
            return;
        }
        if (element.isJsonObject()) {
            JsonObject object = element.getAsJsonObject();
            this.visitor.startObject(object);
            boolean isFirst2 = true;
            for (Map.Entry<String, JsonElement> member : object.entrySet()) {
                boolean visited = visitChild(object, member.getKey(), member.getValue(), isFirst2);
                if (visited && isFirst2) {
                    isFirst2 = false;
                }
            }
            this.visitor.endObject(object);
            return;
        }
        this.visitor.visitPrimitive(element.getAsJsonPrimitive());
    }

    private boolean visitChild(JsonObject parent, String childName, JsonElement child, boolean isFirst) throws IOException {
        if (child.isJsonNull()) {
            if (this.visitNulls) {
                this.visitor.visitNullObjectMember(parent, childName, isFirst);
                navigate(child.getAsJsonNull());
                return true;
            }
            return false;
        }
        if (child.isJsonArray()) {
            JsonArray childAsArray = child.getAsJsonArray();
            this.visitor.visitObjectMember(parent, childName, childAsArray, isFirst);
            navigate(childAsArray);
            return true;
        }
        if (child.isJsonObject()) {
            JsonObject childAsObject = child.getAsJsonObject();
            this.visitor.visitObjectMember(parent, childName, childAsObject, isFirst);
            navigate(childAsObject);
            return true;
        }
        this.visitor.visitObjectMember(parent, childName, child.getAsJsonPrimitive(), isFirst);
        return true;
    }

    private void visitChild(JsonArray parent, JsonElement child, boolean isFirst) throws IOException {
        if (child.isJsonNull()) {
            this.visitor.visitNullArrayMember(parent, isFirst);
            navigate(child);
            return;
        }
        if (child.isJsonArray()) {
            JsonArray childAsArray = child.getAsJsonArray();
            this.visitor.visitArrayMember(parent, childAsArray, isFirst);
            navigate(childAsArray);
        } else {
            if (child.isJsonObject()) {
                JsonObject childAsObject = child.getAsJsonObject();
                this.visitor.visitArrayMember(parent, childAsObject, isFirst);
                navigate(childAsObject);
                return;
            }
            this.visitor.visitArrayMember(parent, child.getAsJsonPrimitive(), isFirst);
        }
    }
}
