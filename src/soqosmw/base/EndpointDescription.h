//
// c Timo Haeckel for HAW Hamburg
//
// This program is free software: you can redistribute it and/or modify
// it under the terms of the GNU Lesser General Public License as published by
// the Free Software Foundation, either version 3 of the License, or
// (at your option) any later version.
//
// This program is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU Lesser General Public License for more details.
//
// You should have received a copy of the GNU Lesser General Public License
// along with this program.  If not, see http://www.gnu.org/licenses/.
//

#ifndef SOQOSMW_BASE_ENDPOINTDESCRIPTION_H_
#define SOQOSMW_BASE_ENDPOINTDESCRIPTION_H_

#include <string>

#include <inet/networklayer/common/L3Address.h>

namespace SOQoSMW {

/**
 * @brief This class describes an Endpoint for soqosmw messages.
 *
 * @ingroup soqosmw/base
 *
 * @author Timo Haeckel
 */
class EndpointDescription {
public:
    EndpointDescription(std::string path, inet::L3Address networkAddr, int networkPort) : _path(path), _networkAddr (networkAddr), _networkPort(networkPort){

    }

    EndpointDescription() {
    }

    virtual ~EndpointDescription() {
    }

    /**
     * comparing operators
     */
    inline bool operator==(EndpointDescription& other) {
        bool value = false;
        if (_networkAddr == other.getNetworkAddr()) {
            if (_networkPort == other.getNetworkPort()) {
                if (_path == other.getPath()) {
                    value = true;
                }
            }
        }
        return value;
    }

    inline bool operator!= (EndpointDescription& other) {
        return !(*this == other);
    }

    inet::L3Address& getNetworkAddr() {
        return _networkAddr;
    }

    void setNetworkAddr(inet::L3Address& networkAddr) {
        _networkAddr = networkAddr;
    }

    int getNetworkPort() {
        return _networkPort;
    }

    void setNetworkPort(int networkPort) {
        _networkPort = networkPort;
    }

    std::string& getPath() {
        return _path;
    }

    void setPath(std::string& path) {
        _path = path;
    }

    std::string toString(){
        std::string ret = "EndpointDescription[";
        ret.append(" path:").append(_path);
        ret.append(" networkAddr:").append(_networkAddr.str());
        ret.append(" networkPort").append(std::to_string(_networkPort));
        return ret.append(" ]");
    }

private:
    /**
     * The name of the Endpoint as a path.
     */
    std::string _path;

    /**
     * The network address of the node running the Endpoint.
     */
    inet::L3Address _networkAddr;

    /**
     * The network port of the Endpoint.
     */
    int _networkPort;
};

} /* namespace SOQoSMW */

#endif /* SOQOSMW_BASE_ENDPOINTDESCRIPTION_H_ */
