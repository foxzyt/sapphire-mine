class ListUtil {
    function create() {
        return [];
    }

    function append(list, value) {
        double currentLength = len(list);
        list[currentLength] = value;
        return list;
    }

    function get(list, double index) {
        return list[index];
    }

    function set(list, double index, value) {
        list[index] = value;
        return list;
    }

    function length(list) double {
        return len(list);
    }

    function removeAt(list, double indexToRemove) {
        double currentLength = len(list);
        if (indexToRemove < 0 || indexToRemove >= currentLength) {
            print("ListUtil.removeAt: Index out of bounds.");
            return nil;
        }

        value removedValue = list[indexToRemove];
        list[indexToRemove] = nil;
        return removedValue;
    }

    function contains(list, valueToFind) bool {
        double i = 0;
        double listLen = len(list);
        while (i < listLen) {
            if (list[i] == valueToFind) {
                return true;
            }
            i = i + 1;
        }
        return false;
    }
}

StringUtil = ListUtil();
