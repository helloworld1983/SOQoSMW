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

#ifndef SOQOSMW_QOSPOLICY_STD_LOCALPORTQOSPOLICY_H_
#define SOQOSMW_QOSPOLICY_STD_LOCALPORTQOSPOLICY_H_

#include <qospolicy/base/types/IntQoSPolicy.h>
#include <string>

namespace soqosmw {

namespace QoSPolicyNames {

const std::string LocalPort = "LocalPort";

} /* namespace QoSPolicyNames */

/**
 * @brief The LocalPortQoSPolicy.
 *
 * @ingroup soqosmw/qospolicy
 *
 * @author Timo Haeckel for HAW Hamburg
 */
class LocalPortQoSPolicy: public IntQoSPolicy {
public:
    LocalPortQoSPolicy(int value) : IntQoSPolicy(value){

    }
    virtual ~LocalPortQoSPolicy(){

    }
};

} /* namespace soqosmw */

#endif /* SOQOSMW_QOSPOLICY_STD_LOCALPORTQOSPOLICY_H_ */
